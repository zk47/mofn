%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function b=binnum(i)
% b=binnum(i)
% Returns the number of 1's in the binary
% represetnation of integer i
% binnum(2)=1
% binnum(3)=2
% binnum(4)=2
% Input i can be a vector (output is a column vector)
x=dec2bin(i(:));
[nr,nc]=size(x);
b=sum(reshape(str2num(reshape(x,nr*nc,1)),nr,nc)')';
