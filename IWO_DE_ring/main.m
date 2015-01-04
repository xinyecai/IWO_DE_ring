function [ParGen, ObjVals,outcome,FFEerror,outcomeG] = ...
    main( nmbOfIndivs, Fct,Cons,A1,minf)

% create initial (parent) generation
ParGen = ParentGen( nmbOfIndivs, Cons);
% evaluate initial generation
[ObjVals G]= Evaluate( ParGen,Fct,A1);
breakflag=1;
FFEerror=0;
outcome=[];
outcomeG=[];
pMax=60;
FFE=size(ObjVals,2);
maxFFE=200000;
i=1;
while FFE<=maxFFE
    index=find(ObjVals(2,:)==0);
    if ~isempty(index)
        feasibleObjTemp=ObjVals(:,index);
        [f minIndex]=min(feasibleObjTemp(1,:));
        if abs(f-minf)<0.0001&&breakflag==1
            FFEerror=FFE;
            breakflag=breakflag+1;
        end
        outcome=[outcome [feasibleObjTemp(:,minIndex); FFE]];
        outcomeG=[outcomeG G(:,index(minIndex))];
    else
        [f minIndex]=min(ObjVals(2,:));
        outcome=[outcome [ObjVals(:,minIndex); FFE]];
        outcomeG=[outcomeG G(:,minIndex)];
    end
    
%       fprintf( 'generation %d\n', i);    

%%
[ParGen ObjVals G FFENum] = PersonalIWO(ParGen,ObjVals,G,Cons,Fct,A1,pMax);
FFE=FFE+FFENum;    
%%
    index=find(ObjVals(2,:)==0);
    if ~isempty(index)
        feasibleObjTemp=ObjVals(:,index);
        [f minIndex]=min(feasibleObjTemp(1,:));
        if abs(f-minf)<0.0001&&breakflag==1
            FFEerror=FFE;
            breakflag=breakflag+1;
        end
        outcome=[outcome [feasibleObjTemp(:,minIndex); FFE]];
        outcomeG=[outcomeG G(:,index(minIndex))];
    else
        [f minIndex]=min(ObjVals(2,:));
        outcome=[outcome [ObjVals(:,minIndex); FFE]];
        outcomeG=[outcomeG G(:,minIndex)];
    end
%%
    NP=size(ObjVals,2);
    f=length(find(ObjVals(2,:)==0));
    percent=f./NP;
%     RingNumTemp=CreatedRing(ObjVals);
%     RingNumTemp=randperm(NP);
% %     [value RingNumTemp]=NSGA_Rank(ObjVals);
%     ParGen=ParGen(:,RingNumTemp);
%     ObjVals=ObjVals(:,RingNumTemp);
    
%     LocalIndexTemp=[NP-1 NP 1:NP 1 2];
    
    LocalIndexTemp=[];
    radius=3;
    for k=1:radius
        LocalIndexTemp=[LocalIndexTemp NP-(radius-k)];
    end
    LocalIndexTemp=[LocalIndexTemp 1:NP];
    for k=1:radius
        LocalIndexTemp=[LocalIndexTemp k];
    end
    
    for j=(radius+1):(NP+radius)
        
%         LocalIndex=[LocalIndexTemp(j-2) LocalIndexTemp(j-1) LocalIndexTemp(j) LocalIndexTemp(j+1) LocalIndexTemp(j+2)];
        
        LocalIndex=[];
        for k=1:radius
            LocalIndex=[LocalIndex LocalIndexTemp(j-(radius-(k-1)))];
        end
        LocalIndex=[LocalIndex LocalIndexTemp(j)];
        for k=1:radius
            LocalIndex=[LocalIndex LocalIndexTemp(j+k)];
        end
        
        LocalPar=ParGen(:,LocalIndex);
        LocalObj=ObjVals(:, LocalIndex);
        LocalG=G(:,LocalIndex);
        [value sortedIndex]=NSGA_Rank(LocalObj);
        IndexTemp=sortedIndex(1);
        BestIndex1=LocalIndex(IndexTemp);
        [value popIndex]=NSGA_Rank(ObjVals);
        BestIndex2=popIndex(1);
        X = ParGen(:, LocalIndex(3));
        ObjX = ObjVals(:, LocalIndex(3));
        globalF = 0.7;
        globalCR=0.9+0.1.*rand;
        U = DE(ParGen, Cons, LocalIndex(3), BestIndex1,BestIndex2,X, globalF, globalCR,percent);
        [ObjU ObjG]= Evaluate(U,Fct,A1);
        [ParGen ObjVals G]=DESelect(U,ObjU,ObjG,ParGen,ObjVals,G);
%         [LocalPar LocalObj LocalG]=DESelect(U,ObjU,ObjG,LocalPar,LocalObj,LocalG);
%         ParGen(:,LocalIndex)=LocalPar;
%         ObjVals(:, LocalIndex)=LocalObj;
%         G(:,LocalIndex)=LocalG;
    end
    FFE=FFE+NP;
%%
    i=i+1;
end
%%
end