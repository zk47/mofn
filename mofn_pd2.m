%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [S, Pd,tc]=mofn_pd2(pv,Kv,m,n)
% Pd=mofn_pd(pv,Lv,m,n)
% Returns Pd for set of success probabilities in pv for the time
% indexes in the vector Lv。
% Kv: 是k次的意思，即第几次实验后进入吸收态的k次。Kv中的值应为大于0的正整数，1表示最开始的第1次。
% Output:
% S: 最小马尔科夫状态结构体
% Pd: is a matrix with length(pv) rows and length(Kv) columns
% tc: 相应的消耗时间
%
S=mofn_setup_opt2(m,n);  % 这个函数也可以替换为mofn_setup_opt(m,n),即来自Abraham的方法
% Don't do this if there are too many states
%if S.ns>133010,   % 这个数字是随便给的
%Pd=nan*ones(size(Lv));
%else
[Pcp,Pcm,pcp]=mofn_states(S);
ns=length(pcp)+1;              % 获得状态数量
P0v=[1;zeros(ns-2,1)];         % 进行状态的初始概率向量. 对应论文中的pc(0). c是下标.
nK=length(Kv);
np=length(pv);
Pd=zeros(np,nK);  % Pd是一个np行，nK列的矩阵
% Construct continuing state trans matrix
for i=1:np,
tic;
Pcc=pv(i)*Pcp+(1-pv(i))*Pcm;   % 进行状态的转移概率矩阵。对应论文的Pcc(k)。cc是下标.
pcs=pv(i)*pcp;                           % 进行状态转变为接受状态的概率转变向量。对应论文的pcs(k)。cs是下标.
% Eigen decomposition 本征分解
[Vc,Dc]=eig(Pcc);  % Vc是特征向量，Dc是对角线是特征值组成的矩阵
dc=diag(Dc);
c=conj(Vc'*P0v).*(Vc\pcs); % 对应论文找那个的a,b，见论文公式(38), (39). conj()是求复数的共轭，为什么是共轭，还不清楚。
Pd(i,:)=abs(sum(repmat(c./(1-dc),1,nK).*(1-repmat(dc,1,nK).^repmat(Kv(:)',ns-1,1)))); %基于论文的公式40. repmat()函数是矩阵的复制扩充
toc;
tc(i,:)=toc;
end;
%end;