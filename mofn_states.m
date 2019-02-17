%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Pcp,Pcm,pcp]=mofn_states(S)
% 用于生成J+, J-这两个指示矩阵（indicator matrices）， j+ 指示向量(indicator vector)
% [Pcp,Pcm,pcp]=mofn_states(S)
% Pcp: 相当于论文中的J+
% Pcm: 相当于论文中的J-
% pcp: 相当于论文中的j+
% Returns the indicator matrices and vector required to form the
% FSMP transition probability matrix.
ns=S.ns;
Pcp=zeros(ns-1); % ns-1 * ns-1 矩阵
Pcm=Pcp;            % ns-1 * ns-1 矩阵
pcp=zeros(ns-1,1);  % ns-1 * 1 列向量
for i=1:(ns-1),
   if S.iHp(i)==ns,
      pcp(i)=1;
   else
     Pcp(i, S.iHp(i))=1;
  end;
  Pcm(i, S.iHm(i))=1;
end;
