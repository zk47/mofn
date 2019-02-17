%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S=mofn_setup_opt(m,n)
% S=mofn_setup_opt(m,n)
% Returns a structure S of states characterizing a sliding m-of-n detector.返回表征m/n滑动窗检测器的状态结构S。
% S.ns = number of states 状态个数
% S.H = integer representation of the state  一个状态的十进制形式
% S.Hp = transitioning state upon a success  检测到成功后的转移状态
% S.iHp = index of state in S.Hp 
% S.Hm = transitioning state upon a failure  检测到失败后的转移状态
% S.iHm = index of state in S.Hm
% S.P = temporary storage for Williams (DSTO-TN-0132) algorithm for Pd
% S.Pp = William's evaluate method use P+, which indicates the probability of a system in certain states at time “k-1”, and these states need to satisfy the following condition: the system happens to change to state S.H  when the result of the next test is ‘1’; 
% S.Pm = William's evaluate method use P-, which indicates the probability of a system in certain states at time “k-1”, and these states need to satisfy the following condition: the system happens to change to state S.H  when the result of the next test is ‘0’; 
% Data are stored in a .mat file so only have to do this once
fname=['mofn_struct_n' int2str(n)];
if (exist([fname '.mat'],'file')==2),
load(fname)
else
% Set structures to be empty for each m on first use
    for i=1:n,
        Sm{i}=[];
    end;
end;
% Calculate structure if not already stored
if isempty(Sm{m})==1,
disp('---- Stand by, calculating structures ----');
fprintf(' m=%i n=%i ',m,n);
tic
% Add the accepting state
i=1;
S.ns=i;
S.P(i)=0;
S.Pp(i)=0;
S.Pm(i)=0;
S.H(i)=2^n;
S.Hp(i)=2^n;
S.Hm(i)=2^n;
% Number of non-accepting states (eq 2 in DSTO-TN-0132)
% Easier to enumerate and find number of non-accepting states
hiall=0:(2^(n-1)-1); % integer rep of each possible history
ibin=binnum(hiall); % sum of 1's of binary rep of each state
hna=hiall(ibin<m); % integer equivalents of non-accepting states
% Loop through all possible non-accepting-states
nnas=length(hna);
fprintf('# states = %i \n',nnas);
for i=1:nnas,
if (nnas>500)&&(rem(i,round(nnas/10))==1),
fprintf('.');
end;
% Reduce to smallest equivalent state
hna0=reduce_hexad(hna(i),m,n);
% If it hasn't been added, then add it
if ~any(S.H==hna0),
S=addhexad_opt(S,hna0,m,n);
end;
end;
toc
% Sort hexads by H
[~,isrt]=sort(S.H);
S.H=S.H(isrt);
S.Hp=S.Hp(isrt);
S.Hm=S.Hm(isrt);
S.P=S.P(isrt);
% Add indices for each
S.iH=1:S.ns;
for i=1:S.ns,
S.iHp(i)=find(S.Hp(i)==S.H);
S.iHm(i)=find(S.Hm(i)==S.H);
end;
% Save data to .mat file for later retrieval
Sm{m}=S;

eval(['save ' fname ' Sm']);
% If structure is stored, then return it
else
S=Sm{m};
end;
[S.H' S.Hm' S.Hp' S.iHm' S.iHp' S.Pp' S.Pm']