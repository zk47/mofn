%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function h0=reduce_hexad(h,m,n)
% h0=reduce_hexad(h,m,n)
% Function internal to mofn_setup_opt(m,n) to reduce a state to the
% "lowest common state", which minimizes the number of unique states
% in the m-of-n FSMP
h0=h;
if binnum(h)~=(m-1),
hp=mod(2*h,2^(n-1))+1;
np=reduce_hexad(hp,m,n);
if np<h,
h0=floor(np/2);
end;
end;