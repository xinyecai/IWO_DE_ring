function RingIndex=CreatedRing(Obj)

[sortedValue sortedIndex]=NSGA_Rank(Obj);
[Front FrontTemp]=unique(sortedValue(:,1));
FrontIndex=cell(length(Front),1);
FrontNum=zeros(length(Front),1);
for i=1:length(Front)
    FrontIndex{i}=find(sortedValue(:,1)==i);
    FrontNum(i)=length(FrontIndex{i});
end
RingIndex=[];
A=max(FrontNum);
for i=1:A
    for j=1:length(Front)
        B=FrontIndex{j};
        FrontNumTemp=FrontNum(j);
        if FrontNumTemp~=0
            C=B(i);
            RingIndex=[RingIndex sortedIndex(C)];
            FrontNum(j)=FrontNumTemp-1;
        end
    end
end
zzz=1;