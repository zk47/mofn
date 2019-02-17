% plot time consumed
N = 10:20;
T1=[0.149,0.208,0.362,0.615,1.214,2.387,4.571,9.143,18.464,38.355,86.247];
T2=[0.94,0.159,0.187,0.286,0.406,0.495,0.670,0.876,1.113,1.441,1.695];

plot(N,T1,'-r+')
title('M=5')
hold on
xlabel('N value');
ylabel('Time consumed (s)')
plot(N,T2,'-g*')

legend('Williams'' method ','Proposed method',0)
