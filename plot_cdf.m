% plot time consumed°£ proposed CMMS + Williams CAP ”Î Williams CMMS +
% Williams CAP±»Ωœ
m = 3;
n =7;
k=50;
pv=0.4:0.1:0.9;

[S, Pd, T] = mofn_williams_pd2(pv, k, m, n);

plot(1:k,Pd(1,:),'-bo') %3/7 p=0.4
axis([0 k,0,1]);
hold on
plot(1:k,Pd(2,:),'-r*') %3/7 p=0.5
axis([0 k,0,1]);
hold on
plot(1:k,Pd(3,:),'-g+') %3/7 p=0.6
axis([0 k,0,1]);
hold on
plot(1:k,Pd(4,:),'-kd') %3/7 p=0.7
axis([0 k,0,1]);
hold on
plot(1:k,Pd(5,:),'-ms') %3/7 p=0.8
axis([0 k,0,1]);
hold on
plot(1:k,Pd(6,:),'-cp') %3/7 p=0.9
axis([0 k,0,1]);
xlabel(' interrogation cycles');
ylabel('CDF');
tit = sprintf('M/N(%d/%d)',m,n);
title(tit);
legend('p=0.4 ','p=0.5','p=0.6','p=0.7','p=0.8','p=0.9',4)

