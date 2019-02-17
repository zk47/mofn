%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Pd=mofn_pd(pv,Lv,m,n)
% Pd=mofn_pd(pv,Lv,m,n)
% Returns Pd for set of success probabilities in pv for the time
% indexes in the vector Lv��
% Lv: ��k�ε���˼�����ڼ���ʵ����������̬��k�Ρ�Lv�е�ֵӦΪ����0����������1��ʾ�ʼ�ĵ�1�Ρ�
% Output Pd is a matrix with length(pv) rows and length(Lv) columns
%
S=mofn_setup_opt2(m,n);  % �������Ҳ�����滻Ϊmofn_setup_opt(m,n),������Abraham�ķ���
% Don't do this if there are too many states
if S.ns>133010,
Pd=nan*ones(size(Lv));
else
[Pcp,Pcm,pcp]=mofn_states(S);
ns=length(pcp)+1;              % ���״̬����
P0v=[1;zeros(ns-2,1)];         % ����״̬�ĳ�ʼ��������. ��Ӧ�����е�pc(0). c���±�.
nL=length(Lv);
np=length(pv);
Pd=zeros(np,nL);  % Pd��һ��np�У�nL�еľ���
% Construct continuing state trans matrix
for i=1:np,
Pcc=pv(i)*Pcp+(1-pv(i))*Pcm;   % ����״̬��ת�Ƹ��ʾ��󡣶�Ӧ���ĵ�Pcc(k)��cc���±�.
pcs=pv(i)*pcp;                           % ����״̬ת��Ϊ����״̬�ĸ���ת����������Ӧ���ĵ�pcs(k)��cs���±�.
% Eigen decomposition �����ֽ�
[Vc,Dc]=eig(Pcc);  % Vc������������Dc�ǶԽ���������ֵ��ɵľ���
dc=diag(Dc);
c=conj(Vc'*P0v).*(Vc\pcs); % ��Ӧ�������Ǹ���a,b�������Ĺ�ʽ(38), (39). conj()�������Ĺ��Ϊʲô�ǹ�����������
Pd(i,:)=abs(sum(repmat(c./(1-dc),1,nL).*(1-repmat(dc,1,nL).^repmat(Lv(:)',ns-1,1)))); %�������ĵĹ�ʽ40. repmat()�����Ǿ���ĸ�������
end;
end;