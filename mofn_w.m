%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function wh =mofn_w(b1,vs)
% Author: zhaokang  
% 2018.12
% Remve all consecutive 1s from the highest bit in h
% b1 : highest bit 1 of h. ( So, in vs string , it's the lowest bit 1.)
% vs: binary string of h.  (This is a string)
% 
% Caculate w(h)
[~,len] = size(vs); %get the length of binary string

for i=b1:len,
    if(vs(i)=='1')
        vs(i)='0';
    else
        break;
    end
end
wh = bin2dec(vs);