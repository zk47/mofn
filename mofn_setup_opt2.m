%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S=mofn_setup_opt2(m,n)
% Author: zhaokang  
% 2018.12
% S=mofn_setup_opt(m,n)
% Returns a structure S of states characterizing a sliding m-of-n
% detector,using a new method,which can direct create the minimal-order
% Markov set of M/N sliding window.
% S.ns = number of states 
% S.H = integer representation of the state 
% S.Hp = transitioning state upon a success 
% S.iHp = index of state in S.Hp 
% S.Hm = transitioning state upon a failure
% S.iHm = index of state in S.Hm
% S.P = temporary storage for Williams (DSTO-TN-0132) algorithm for Pd
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
tic  % set start time
% New method create  M/N sliding minimal-order Markov state set
% 1. Add absorption(accepting) state to the set; Initialize j=0;
% 2. List all the states h, which satisfying N-M+j bits that exactly contain j
% 1s; Increment j by one; If j==M,the process ends;
% 3. Repeat 2.

% Init all states
S.ns=nchoosek(n,m-1)+1; % Direct caculate the size of minimal-order Markov state set
fprintf('# states = %i \n',S.ns);
S.P=zeros(1,S.ns);
S.H=zeros(1,S.ns);
S.Hp=zeros(1,S.ns);
S.Hm=zeros(1,S.ns);
% Add the accepting state
S.H(S.ns)=2^n;
S.Hp(S.ns)=2^n;
S.Hm(S.ns)=2^n;
nm = n-m;
%n-m bits contain 0 1s.
S.H(1)=0;
S.Hp(1)=mofn_hp(0,m,n); % Caculate H+;
S.Hm(1)=0; % Caculate H-;
i=2;
for j=1:m-1,
    k = nm + j;
    v=nchoosek(1:k, j); % Create combinations of k bits contain j ones.
    [nr,~] = size(v); % Get number of combinations
    
    for r=1:nr,
        
        % Use  '.' printing progress
        if (S.ns>500)&&(rem(i,round(S.ns/10))==1),
            fprintf('.'); 
        end;  
        
        vh = zeros(1,k);
        b1 = min(v(r,:));          % Get the highest bit 1 posion.(in string)
        h1=k-b1+1; % Caculate the highest bit 1 position, in binary.
        vh(v(r,:))=1;
        vs = num2str(vh);
        vs(find(isspace(vs))) = []; % Delete all space, or bin2dec will error
        S.H(i)=bin2dec(vs);
        S.Hp(i)=mofn_hp(S.H(i),m,n); % Caculate H+;
        S.Hm(i)=mofn_hm(S.H(i),h1,b1,vs,m,n); % Caculate H-;
        i=i+1;
    end
end
toc  % get stop times
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
[S.H' S.Hm' S.Hp' S.iHm' S.iHp'];