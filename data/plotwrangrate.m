numb=1000000;
arr0=waring_rate(0.08,5,numb);
arr1=waring_rate(0.1,5,numb);
arr2=waring_rate(0.11,5,numb);
arr3=waring_rate(0.15,5,numb);
arr4=waring_rate(0.18,5,numb);
plot(1:numb,arr0,'-g')
hold on

plot(1:numb,arr1,'-b')
hold on
plot(1:numb,arr2,'-r')
hold on
plot(1:numb,arr3,'-k')
hold on
plot(1:numb,arr4,'-m')
xlabel('X');
ylabel('Probability distribution function F(X)')
title('Miss Detection Probability,K=5  ')
legend('pm=0.08 ','pm=0.1','pm=0.11','pm=0.15','pm=0.18',1)
