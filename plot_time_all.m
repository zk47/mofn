% plot time consumed°£ proposed CMMS + Williams CDP ”Î Williams CMMS +
% Williams CDP±»Ωœ
m = 10;
n=15;
k=50;
pv=0.8;
[S1, Pd1, T1]=mofn_williams_pd(pv, k, m, n);
delete(sprintf('mofn_struct_n%d.mat', n));
[S2, Pd2, T2] = mofn_williams_pd2(pv, k, m, n);
delete(sprintf('mofn_struct_n%d.mat', n));
s1 = ones(1,k)*S1.t;
p1=plot(1:k, s1, '--m');
ts=sprintf('M=%d,N=%d',m,n);hold on;
title(ts)

s2 = ones(1,k)*S2.t;
p2=plot(1:k, s2, '--b');hold on;

T1=T1+S1.t;
T2=T2+S2.t;

p3=plot(1:k,T1,'-r+');hold on;

xlabel('scan number');
ylabel('Time consumed (s)');
p4=plot(1:k,T2,'-g*');

legend([p1(1),p2(1),p3(1),p4(1)], 'Williams CMMS algorithm', 'proposed CMMS algorithm', 'Williams CMMS + Williams CDP', 'proposed CMMS + Williams CDP');
%legend('Williams CMMS algorithm','proposed CMMS algorithm','Williams CMMS + Williams CDP','proposed CMMS + Williams CDP')