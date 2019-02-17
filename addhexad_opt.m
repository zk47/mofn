%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S=addhexad_opt(S,h,m,n)
% S=addhexad_opt(S,h,m,n)
% Function internal to mofn_setup_opt(m,n) to add a hexad to structure
%
i=S.ns+1; % Find index for this hexad
S.ns=i; % Increment number of hexads
S.P(i)=0;
S.Pp(i)=0;
S.Pm(i)=0;
S.H(i)=h; % Current hexad's integer state represenation
% If next trial is a failure
hm=mod(2*h,2^(n-1)); % Integer state
hm0=reduce_hexad(hm,m,n); % Reduce to smallest equivalent state
S.Hm(i)=hm0;
% If next trial is a success
% If meeting m-of-n criteria
if binnum(h)==(m-1),
S.Hp(i)=2^n; % Accepting state integer ID
% Otherwise into a continuing state
else
hp=hm+1; % Integer state
S.Hp(i)=reduce_hexad(hp,m,n); % Reduce to smallest equivalent state
end;