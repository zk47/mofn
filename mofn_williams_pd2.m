%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [S, Pd, tc]=mofn_williams_pd2(pv, k, m,n)
% Author: zhaokang  
% 2019.02
% 用于生成k时刻进入A状态的概率. 该方法请参考Williams论文的Algorithm 2
% pv, 想要计算概率向量；
% k, 想要计算的k值；k中的值应为大于0的正整数，1表示最开始的第1次。
% Output:
% S: 最小马尔科夫状态结构体
% Pd: is a matrix with length(pv) rows and k columns. 即结果会给出1:k的所有中间的检测概率
% tc: 相应的消耗时间,不包含S结构的创建时间.
%
S=mofn_setup_opt2(m,n);  % 这个函数可以替换为mofn_setup_opt(m,n),即来自Abraham的方法
np=length(pv);
Pd = zeros(np, k);  % 初始化np行，k列
tc =zeros(np,k); % 初始化消耗时间
for r = 1:np
    tic;
    S.P=zeros(1,S.ns);
    S.P(1)=1;  % Init propability
    for kt = 1:k  % 求kv中最大数，最为循环的终结。
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


