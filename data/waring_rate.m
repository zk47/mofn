% 用于计算连续k个0（既判断为不在叉车上）在某个时刻出现概率的分布概率
% p=0.1;  货物在叉车上漏检概率
% k=5;    连续实验窗口大小
% numb=1000000;  试验次数

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
% 计算分布概率，需要求和
for ii=2:numb
    arr(ii)=arr(ii-1)+arr(ii);
end

%plot(1:numb,arr,'-bo')
