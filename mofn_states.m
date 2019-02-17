%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Pcp,Pcm,pcp]=mofn_states(S)
% ��������J+, J-������ָʾ����indicator matrices���� j+ ָʾ����(indicator vector)
% [Pcp,Pcm,pcp]=mofn_states(S)
% Pcp: �൱�������е�J+
% Pcm: �൱�������е�J-
% pcp: �൱�������е�j+
% Returns the indicator matrices and vector required to form the
% FSMP transition probability matrix.
ns=S.ns;
Pcp=zeros(ns-1); % ns-1 * ns-1 ����
Pcm=Pcp;            % ns-1 * ns-1 ����
pcp=zeros(ns-1,1);  % ns-1 * 1 ������
for i=1:(ns-1),
   if S.iHp(i)==ns,
      pcp(i)=1;
   else
     Pcp(i, S.iHp(i))=1;
  end;
  Pcm(i, S.iHm(i))=1;
end;
