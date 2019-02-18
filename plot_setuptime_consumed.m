% plot time consumed
m = 5;
N = 10:20;
T1 = zeros(1, length(N));
T2= zeros(1, length(N));

k=1;
for i=N
S = mofn_setup_opt(m, i);
T1(k)=S.t;
delete(sprintf('mofn_struct_n%d.mat', i));
S = mofn_setup_opt2(m, i);
T2(k)=S.t;
delete(sprintf('mofn_struct_n%d.mat', i));
k=k+1;
end;


%T1=[0.149,0.208,0.362,0.615,1.214,2.387,4.571,9.143,18.464,38.355,86.247];
%T2=[0.94,0.159,0.187,0.286,0.406,0.495,0.670,0.876,1.113,1.441,1.695];

plot(N,T1,'-r+')
ts=sprintf('M=%d',m);
title(ts)
hold on
xlabel('N value');
ylabel('Time consumed (s)')
plot(N,T2,'-g*')

legend('Williams'' method ','Proposed method',0)
