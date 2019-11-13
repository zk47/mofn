%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [S, Pd, tc]=mofn_williams_pd2(pv, k, m,n)
% Author: zhaokang  
% 2019.02
% ��������kʱ�̽���A״̬�ĸ���. �÷�����ο�Williams���ĵ�Algorithm 2
% pv, ��Ҫ�������������
% k, ��Ҫ�����kֵ��k�е�ֵӦΪ����0����������1��ʾ�ʼ�ĵ�1�Ρ�
% Output:
% S: ��С����Ʒ�״̬�ṹ��
% Pd: is a matrix with length(pv) rows and k columns. ����������1:k�������м�ļ�����
% tc: ��Ӧ������ʱ��,������S�ṹ�Ĵ���ʱ��.
%
S=mofn_setup_opt2(m,n);  % ������������滻Ϊmofn_setup_opt(m,n),������Abraham�ķ���
np=length(pv);
Pd = zeros(np, k);  % ��ʼ��np�У�k��
tc =zeros(np,k); % ��ʼ������ʱ��
for r = 1:np
    tic;
    S.P=zeros(1,S.ns);
    S.P(1)=1;  % Init propability
    for kt = 1:k  % ��kv�����������Ϊѭ�����սᡣ
        S.Pp=zeros(1,S.ns);
        S.Pm=zeros(1,S.ns);
        for i = 1:S.ns
           S.Pp(S.iHp(i)) = S.Pp(S.iHp(i)) + S.P(i);
           S.Pm(S.iHm(i))  =  S.Pm(S.iHm(i)) + S.P(i);
        end;
        for j = 1:S.ns
           S.P(j) = pv(r)*S.Pp(j)+(1-pv(r))*S.Pm(j);
        end;
        Pd(r, kt) = S.P(S.ns);
        toc;
        tc(r,kt) = toc;
    end;
end;


