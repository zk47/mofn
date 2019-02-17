%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [uK,sK,err]=mofn_stats(pv,S,P0v)
% [uK,sK]=mofn_stats(pv,S,P0v)
% Returns the mean and standard deviation of the stopping time
% for the m-of-n process defined by the structure S.
% pv = vector of Bernoulli probabilities to be evaluated
% S = structure describing m-of-n process (see mofn_setup)
% P0v = vector of initial starting probabilities
% = [1 0 ... 0]' by default
%
% uK = average stopping time (latency) for each value in pv
% sK = standard deviation of stopping time
%
[Pcp,Pcm,pcp]=mofn_states(S);
ns=length(pcp)+1;
if nargin<3,
P0v=[1;zeros(ns-2,1)];
else
P0v=P0v(1:(ns-1));
end;
uK=zeros(size(pv));
sK=uK;
for i=1:length(pv),
% Construct continuing state trans matrix
Pcc=pv(i)*Pcp+(1-pv(i))*Pcm;
pcs=pv(i)*pcp;
% Eigen decomposition
[Vc,Dc]=eig(Pcc);
dc=diag(Dc);
% If eigenvectors are not linearly independent use pseudoinverse
if rcond(Vc)<1e-10,
cc=pinv(Vc)*pcs;
else
cc=Vc\pcs;
end;
% Check to make sure pseudoinverse worked
err1=max(abs(pcs-Vc*cc));
if err1>sqrt(eps), disp('**** Error ****'); end;
err(i)=rcond(Vc);
% Form coefficients
c=(P0v'*Vc).'.*(cc);
% Form mean, power & standard deviation
uK(i)=real(sum(c./(1-dc).^2));
pK=real(sum(c.*(1+dc)./(1-dc).^3));
sK(i)=sqrt(pK-uK(i)^2);
end;