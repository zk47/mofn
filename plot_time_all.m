% plot time consumed�� proposed CMMS + Williams CDP �� Williams CMMS +
% Williams CDP�Ƚ�
m = 10;
n=15;
k=50;
pv=0.8;
[S1, Pd1, T1]=mofn_williams_pd(pv, k, m, n);
delete(sprintf('mofn_struct_n%d.mat', n));
[S2, Pd2, T2] = mofn_williams_pd2(pv, k, m, n);
delete(sprintf('mofn_struct_n%d.mat', n));
T1=T1+S1.t;
T2=T2+S2.t;
%T1=[0.149,0.208,0.362,0.615,1.214,2.387,4.571,9.143,18.464,38.355,86.247];
%T2=[0.94,0.159,0.187,0.286,0.406,0.495,0.670,0.876,1.113,1.441,1.695];

plot(1:k,T1,'-r+')
ts=sprintf('M=%d,N=%d',m,n);
title(ts)
hold on
xlabel('number of scans');
ylabel('Time consumed (s)')
plot(1:k,T2,'-g*')

legend('Williams CMMS + Williams CDP','proposed CMMS + Williams CDP',0)