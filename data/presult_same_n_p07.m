p_5_20 = importdata('presult_5_20_0.7.txt');
plot(p_5_20(:,1),p_5_20(:,2),'-ms') %5/20 p=0.7

hold on
p_10_20 = importdata('presult_10_20_0.7.txt');
plot(p_10_20(:,1),p_10_20(:,2),'-r*') %10/20 p=0.7

hold on
p_15_20 = importdata('presult_15_20_0.7.txt');
plot(p_15_20(:,1),p_15_20(:,2),'-bo') %15/20 p=0.7

hold on
p_18_20 = importdata('presult_18_20_0.7.txt');
plot(p_18_20(:,1),p_18_20(:,2),'-g+') %18/20 p=0.7

hold on
p_19_20 = importdata('presult_19_20_0.7.txt');
plot(p_19_20(:,1),p_19_20(:,2),'-kd') %19/20 p=0.7

xlabel('X');
ylabel('Probability distribution function F(X)')
title('p=0.7, diffrent M')
legend('5/20','10/20 ','15/20','18/20','19/20',4)
