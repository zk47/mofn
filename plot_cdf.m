% plot time consumed�� proposed CMMS + Williams CAP �� Williams CMMS +
% Williams CAP�Ƚ�
m = 3;
n =7;
k=30;
pv=0.5:0.1:0.9;

[S, Pd, T] = mofn_williams_pd2(pv, k, m, n);

% plot(1:k,Pd(1,:),'-bo') %3/7 p=0.4
% axis([0 k,0,1]);
% hold on
plot(1:k,Pd(1,:),'-r*') %3/7 p=0.5
axis([0 k,0,1]);
hold on
plot(1:k,Pd(2,:),'-g+') %3/7 p=0.6
axis([0 k,0,1]);
hold on
plot(1:k,Pd(3,:),'-kd') %3/7 p=0.7
axis([0 k,0,1]);
hold on
plot(1:k,Pd(4,:),'-ms') %3/7 p=0.8
axis([0 k,0,1]);
hold on
plot(1:k,Pd(5,:),'-cp') %3/7 p=0.9
axis([0 k,0,1]);
xlabel(' interrogation cycles');
ylabel('CDF');
tit = sprintf('M/N(%d/%d)',m,n);
title(tit);
legend('p=0.5','p=0.6','p=0.7','p=0.8','p=0.9',4)

