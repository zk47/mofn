% ���ڼ�������k��0�����ж�Ϊ���ڲ泵�ϣ���ĳ��ʱ�̳��ָ��ʵķֲ�����
% p=0.1;  �����ڲ泵��©�����
% k=5;    ����ʵ�鴰�ڴ�С
% numb=1000000;  �������

 function [arr]=waring_rate(p,k,numb)

p0=power(p,5);
p1=p0*(1-p);
arr=zeros(numb,1);
arr(k-1)=p0;

for ii=k:(2*k-1)
    arr(ii) = p1;
end
p3=0;
for ii=2*k : numb
    p3 = p3 + arr(ii - k + 1);
    arr(ii)=p1*(1-p3);
end
% ����ֲ����ʣ���Ҫ���
for ii=2:numb
    arr(ii)=arr(ii-1)+arr(ii);
end

%plot(1:numb,arr,'-bo')
