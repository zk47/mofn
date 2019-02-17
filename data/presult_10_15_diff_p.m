p_10_15_04 = importdata('presult_10_15_0.4.txt');
plot(p_10_15_04(:,1),p_10_15_04(:,2),'-bo') %10/15 p=0.4

hold on
p_10_15_05 = importdata('presult_10_15_0.5.txt');
plot(p_10_15_05(:,1),p_10_15_05(:,2),'-r*') %10/15 p=0.5

hold on
p_10_15_06 = importdata('presult_10_15_0.6.txt');
plot(p_10_15_06(:,1),p_10_15_06(:,2),'-g+') %10/15 p=0.6

hold on
p_10_15_07 = importdata('presult_10_15_0.7.txt');
plot(p_10_15_07(:,1),p_10_15_07(:,2),'-kd') %10/15 p=0.7

hold on
p_10_15_08 = importdata('presult_10_15_0.8.txt');
plot(p_10_15_08(:,1),p_10_15_08(:,2),'-ms') %10/15 p=0.8

hold on
p_10_15_09 = importdata('presult_10_15_0.9.txt');
plot(p_10_15_09(:,1),p_10_15_09(:,2),'-cp') %10/15 p=0.9

xlabel('X');
ylabel('Probability distribution function F(X)')
title('M/N(10/15)')
legend('p=0.4 ','p=0.5','p=0.6','p=0.7','p=0.8','p=0.9',4)
