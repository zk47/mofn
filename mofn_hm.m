%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Hm=mofn_hm(h,h1,b1,vs,m,n)
% Author: zhaokang  
% 2018.12
% h: H value
% h1: highest position bit 1 in binary
% b1: lowest position bit 1 in vs string.( h1 and b1 are the same thing)
% Caculate H+
if(n-m>h1-binnum(h))
    Hm=2*h;
else  % if n-m=h1-binum(h)
    Hm=2*mofn_w(b1,vs);
end