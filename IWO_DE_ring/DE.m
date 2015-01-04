function U = DE(Indivs, Cons, i, BestIndex1,BestIndex2, X,F, CR, per)

[nmbOfVars nmbOfIndivs]=size(Indivs);
%%
LocalPop=Indivs(:,BestIndex1);
globalPop=Indivs(:,BestIndex2);
IndexSet=1:nmbOfIndivs;
% IndexSet([i BestIndex1 BestIndex2])=[];
IndexSet([i BestIndex1])=[];
% IndexSet([i BestIndex2])=[];
selectedIndex = randperm( prod( size( IndexSet)));
selectedIndex=selectedIndex(1:3);
r=IndexSet(selectedIndex);
% V = X + 0.5.* (LocalPop -X)+0.5.* (globalPop -X)+F.*(Indivs(:,r(1))-Indivs(:,r(2)));
% V = X + (1-per).* (LocalPop -X)+per.* (globalPop -X)+F.*(Indivs(:,r(1))-Indivs(:,r(2)));
V = X + F.* (LocalPop -X)+F.*(Indivs(:,r(1))-Indivs(:,r(2)));
% V = X + F.* (globalPop -X)+F.*(Indivs(:,r(1))-Indivs(:,r(2)));
XTemp=X;
%% 
up=Cons( :, 2);
low=Cons( :, 1);
upIndex =  up-V;
lowIndex = V-low;
A1=upIndex<0;
B1=lowIndex<0;
V(A1)=(XTemp(A1)+up(A1))./2;
V(B1)=(XTemp(B1)+low(B1))./2;
%%
jRand = floor(rand * nmbOfVars) + 1;
t = rand(nmbOfVars,1) < CR;
t(jRand,1) = 1;
t_ = 1 - t;

U = t .* V + t_ .* X;
