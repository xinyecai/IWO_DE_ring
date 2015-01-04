function [SortedValue SortedIdx] = NSGA_Rank(ObjVals)

[nmbOfObjs nmbOfIndivs] = size( ObjVals);

% Pareto-optimal fronts
Front = [];
% number of Pareto-optimal front for each individual; 2nd highest priority sorting key
NmbOfFront = zeros( nmbOfIndivs, 1);
% set of individuals a particular individual dominates
Dominated = cell( nmbOfIndivs, 1);
% number of individuals by which a particular individual is dominated
NmbOfDominating = zeros( nmbOfIndivs, 1);
for p = 1:nmbOfIndivs
    Dominated{p}=find(((ObjVals(1,p)<=ObjVals(1,:)&ObjVals(2,p)<=ObjVals(2,:))&(ObjVals(1,p)<ObjVals(1,:)|ObjVals(2,p)<ObjVals(2,:)))==1);
    NmbOfDominating(p)=length(find(((ObjVals(1,:)<=ObjVals(1,p)&ObjVals(2,:)<=ObjVals(2,p))&(ObjVals(1,:)<ObjVals(1,p)|ObjVals(2,:)<ObjVals(2,p)))==1));
    if NmbOfDominating( p) == 0
        NmbOfFront( p) = 1;
        Front = [Front p];
    end
end
Nmb=NmbOfDominating;
i=1;
while ~isempty( Front)
  NextFront = [];
  for k = 1:length( Front)
    p = Front(k);
    DominatedIndex=Dominated{ p};
    DominatedNum=NmbOfDominating( DominatedIndex);
    DominatedNum= DominatedNum - 1;
    NmbOfDominating( DominatedIndex)=DominatedNum;
    if ismember(0,DominatedNum)
        IndexTemp=find(DominatedNum==0);
        Next=DominatedIndex(IndexTemp);
        NmbOfFront(Next)=i+1;
        NextFront=[NextFront Next];
    end
  end
  Front = NextFront;
  i=i+1;
end

% rank of each individual
[SortedValue SortedIdx] = sortrows( [NmbOfFront ObjVals(2,:)']);
zzz=1;
