n0 = 10:20;
 
N1= power(2,n0);
N2=n0;
j=1;
for i=n0
    N2(j)=nchoosek(i,floor(i/2));
   j=j+1;
end
 
plot(n0,N1,'-r+')
%title('M=N/2')
hold on
xlabel('N value');
ylabel('time complexity')
plot(n0,N2,'-g*')
legend('Williams''  method ','Proposed method (M=N/2)',2)
