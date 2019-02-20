p_10_12 = importdata('presult_10_12_0.7.txt');
plot(p_10_12(:,1),p_10_12(:,2),'-bo') %10/12 p=0.7

hold on
p_10_14 = importdata('presult_10_14_0.7.txt');
plot(p_10_14(:,1),p_10_14(:,2),'-r*') %10/14 p=0.7

hold on
p_10_15 = importdata('presult_10_15_0.7.txt');
plot(p_10_15(:,1),p_10_15(:,2),'-g+') %10/15 p=0.7

hold on
p_10_17 = importdata('presult_10_17_0.7.txt');
plot(p_10_17(:,1),p_10_17(:,2),'-kd') %10/17 p=0.7

hold on
p_10_20 = importdata('presult_10_20_0.7.txt');
plot(p_10_20(:,1),p_10_20(:,2),'-ms') %10/20 p=0.7

xlabel('scan number');
ylabel('Probability distribution function F(X)')
title('\alpha=0.7, diffrent N')
legend('10/12 ','10/14','10/15','10/17','10/20',4)
