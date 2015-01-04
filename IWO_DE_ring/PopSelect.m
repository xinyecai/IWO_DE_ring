function [ParGen ObjVals]=PopSelect(Pop,Obj,pMax)

[SortedValue SortedIndex]=NSGA_Rank(Obj);
[Front FrontNum]=unique(SortedValue(:,1));
selectNum=0;
remainSpace=pMax;
selectIndex=[];
for i=1:length(Front)
    A=find(SortedValue(:,1)==Front(i));
    B=length(A);
    selectNumTemp=round(B.*2./3);
    selectNum=selectNum+round(B.*2./3);
    if selectNum<pMax
        selectIndexTemp=A(1:selectNumTemp);
        selectIndex=[selectIndex selectIndexTemp'];
        remainSpace=remainSpace-selectNumTemp;
    else
        selectIndexTemp=A(1:remainSpace);
        selectIndex=[selectIndex selectIndexTemp'];
        break;
    end
end
bestIndex=SortedIndex(selectIndex);
ParGen=Pop(:,bestIndex);
ObjVals=Obj(:,bestIndex);
zzz=1;