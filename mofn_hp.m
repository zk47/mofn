%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Hp=mofn_hp(h,m,n)
% Author: zhaokang  
% 2018.12
% Caculate H+
if(binnum(h)==m-1)
    Hp=2^n;  % absorption(accepting) state
else
    Hp=2*h+1;
end