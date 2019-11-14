% plot time consumed°£ proposed CMMS + Williams CAP ”Î Williams CMMS +
% Williams CAP±»Ωœ
m = 3;
n =7;
k=3000;
pv=0.5:0.01:0.99;

[S, Pd, T] = mofn_williams_pd2(pv, k, m, n);
temp = zeros(size(Pd,1),1);
Pd2=[temp,Pd];
Pd2(:,size(Pd2,2))=[];
Pd3 = Pd-Pd2;
t=0:k-1;
t=repmat(t,size(Pd,1),1);

t = t.*Pd3;
t = sum(t,2);
plot(pv,t,'-bo');

% plot(1:k,Pd(1,:),'-bo') %3/7 p=0.4
% axis([0 k,0,1]);
% hold on
% plot(1:k,Pd(1,:),'-r*') %3/7 p=0.5
% axis([0 k,0,1]);
% hold on
% plot(1:k,Pd(2,:),'-g+') %3/7 p=0.6
% axis([0 k,0,1]);
% hold on
% plot(1:k,Pd(3,:),'-kd') %3/7 p=0.7
% axis([0 k,0,1]);
% hold on
% plot(1:k,Pd(4,:),'-ms') %3/7 p=0.8
% axis([0 k,0,1]);
% hold on
% plot(1:k,Pd(5,:),'-cp') %3/7 p=0.9
% axis([0 k,0,1]);
xlabel(' p');
ylabel('E(T)');
tit = sprintf('M/N(%d/%d)',m,n);
title(tit);
% legend('p=0.5','p=0.6','p=0.7','p=0.8','p=0.9',4)
