function [ParGen ObjVals G]=DESelect(U,ObjU,ObjG,ParGen,ObjVals,G)

if ObjU(2,1)==0
    index1=find(ObjVals(2,:)==0);
    if isempty(index1)
        [value index]=max(ObjVals(2,:));
        ParGen(:,index(1))=U;
        ObjVals(:,index(1))=ObjU;
        G(:,index(1))=ObjG;
    else
        feasibleObj=ObjVals(:,index1);
        if ~ismember(1,(feasibleObj(1,:)<ObjU(1,1)))
            [value index]=max(feasibleObj(1,:));
            ParGen(:,index(1))=U;
            ObjVals(:,index(1))=ObjU;
            G(:,index(1))=ObjG;
        end
    end
elseif ObjU(2,1)~=0
    index2=find(ObjVals(2,:)~=0);
    if isempty(index2)
        [value index]=max(ObjVals(1,:));
        ParGen(:,index(1))=U;
        ObjVals(:,index(1))=ObjU;
        G(:,index(1))=ObjG;
    else
        infeasibleObj=ObjVals(:,index2);
        if ~ismember(1,(infeasibleObj(1,:)<=ObjU(1,1)&infeasibleObj(2,:)<=ObjU(2,1))&...
                (infeasibleObj(1,:)<ObjU(1,1)|infeasibleObj(2,:)<ObjU(2,1)))
            A=find(((ObjU(1,:)<=infeasibleObj(1,:)&ObjU(2,:)<=infeasibleObj(2,:))&(ObjU(1,:)<infeasibleObj(1,:)|ObjU(2,:)<infeasibleObj(2,:)))==1);
            B=infeasibleObj(:,A);
            if ~isempty(A)
                [value index]=max(B(2,:));
                ParGen(:,index2(A(index(1))))=U;
                ObjVals(:,index2(A(index(1))))=ObjU;
                G(:,index2(A(index(1))))=ObjG;
            else
                [value index]=max(infeasibleObj(2,:));
                if ObjU(2,:)<infeasibleObj(2,index(1))
                    ParGen(:,index2(index(1)))=U;
                    ObjVals(:,index2(index(1)))=ObjU;
                    G(:,index2(index(1)))=ObjG;
                end
            end
        end
    end
end