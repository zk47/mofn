% plot time consumed
N = 10:20;
T1=[149,208,362,615,1214,2387,4571,9143,18464,38355,86247];
T2=[94,159,187,286,406,495,670,876,1113,1441,1695];

plot(N,T1,'-r+')
title('M=5')
hold on
xlabel('N value');
ylabel('Time consumed (ms)')
plot(N,T2,'-g*')

legend('Williams'' method ','Proposed method',0)
