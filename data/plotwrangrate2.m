numb=50;
arr0=waring_rate(0.3,5,numb);
 
plot(1:numb,arr0,'-rd')
hold on
p_10_12 = importdata('presult_5_20_0.7.txt');

plot(p_10_12(:,1),p_10_12(:,2),'-bo') %10/12 p=0.7

xlabel('X');
ylabel('Probability distribution function F(X)');
title('Comparison of detection and missed detection probability,p=0.7  ')
legend('K=5,missed detection','M/N=5/20,detection',1)
