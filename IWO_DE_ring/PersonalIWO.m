function [ParGen ObjVals G FFENum] = PersonalIWO(ParGen,ObjVals,G,Cons,Fct,A,pMax)

Smin=0;
Smax=2;
[nmbOfVars nmbOfIndivs] = size( ParGen);
%%
% RingNumTemp=CreatedRing(ObjVals);
% RingNumTemp=randperm(nmbOfIndivs);
% %     [value RingNumTemp]=NSGA_Rank(ObjVals);
% ParGen=ParGen(:,RingNumTemp);
% ObjVals=ObjVals(:,RingNumTemp);

index1=find(ObjVals(2,:)==0);
feasiblePercent=length(index1)./nmbOfIndivs;
objFun=ObjVals(1,:);
conVio=ObjVals(2,:);
minObj=min(objFun);
maxObj=max(objFun);
minCon=min(conVio);
maxCon=max(conVio);
NorObj=sqrt(feasiblePercent.*((objFun-minObj)./((maxObj-minObj)+1e-30)).^2+(1-feasiblePercent).*((conVio-minCon)./((maxCon-minCon)+1e-30)).^2);
Ranking=(NorObj-min(NorObj))./((max(NorObj)-min(NorObj))+1e-30);
seeds=floor(Smin+(Smax-Smin).*(1-Ranking));
FFENum=sum(seeds);


% LocalIndexTemp=[nmbOfIndivs-1 nmbOfIndivs 1:nmbOfIndivs 1 2];

LocalIndexTemp=[];
radius=3;
for k=1:radius
    LocalIndexTemp=[LocalIndexTemp nmbOfIndivs-(radius-k)];
end
LocalIndexTemp=[LocalIndexTemp 1:nmbOfIndivs];
for k=1:radius
    LocalIndexTemp=[LocalIndexTemp k];
end

offspring=[];

LocalNum=2.*radius;
for j=(radius+1):(nmbOfIndivs+radius)
    LocalIndex1=LocalIndexTemp(j);
    
    
%     LocalIndex2=[LocalIndexTemp(j-2) LocalIndexTemp(j-1) LocalIndexTemp(j+1) LocalIndexTemp(j+2)];
    
    LocalIndex2=[];
    for k=1:radius
        LocalIndex2=[LocalIndex2 LocalIndexTemp(j-(radius-(k-1)))];
    end
    for k=1:radius
        LocalIndex2=[LocalIndex2 LocalIndexTemp(j+k)];
    end

    CenterPop=ParGen(:,LocalIndex1);
    LocalPop=ParGen(:, LocalIndex2);
    LocalNorObj=NorObj(:,LocalIndex2);
    temp1=LocalPop-repmat(CenterPop,1,LocalNum);
    temp2=temp1*LocalNorObj';
    temp3=sum(LocalNorObj)+0.0001;
    temp4=temp2./temp3;
%     temp5=temp4./5;
    temp5=temp4./(2.*radius);
%     temp5=temp4./nmbOfIndivs;
%     temp5=temp4./nmbOfIndivs;
    seedNum=seeds(j-radius);
    CenterPopTemp=repmat(CenterPop,1,seedNum);
    offspringTemp=CenterPopTemp+repmat(sqrt(abs(temp5)),1,seedNum).*randn(nmbOfVars,seedNum);
    up=repmat(Cons( :, 2),1,seedNum);
    low=repmat(Cons( :, 1),1,seedNum);
    upIndex =  up-offspringTemp;
    lowIndex = offspringTemp-low;
    A1=upIndex<0;
    B1=lowIndex<0;
    offspringTemp(A1)=(CenterPopTemp(A1)+up(A1))./2;
    offspringTemp(B1)=(CenterPopTemp(B1)+low(B1))./2;
    offspring=[offspring offspringTemp];
end
offspring=DMutation(offspring,Cons);
[offspringObj offG]=Evaluate( offspring,Fct,A);
ParGen=[ParGen offspring];
ObjVals=[ObjVals offspringObj];
G=[G offG];
pop_num=size(ObjVals,2);
if pop_num>pMax
    [ParGen ObjVals G]=select(ParGen,ObjVals,G,pMax);
%     [ParGen ObjVals]=PopSelect(ParGen,ObjVals,pMax);
end
zzz=1;
end
