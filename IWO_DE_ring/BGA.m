function offspring=BGA(offspring,Cons)

[dim_num pop_num]=size(offspring);
Mprob=(1./dim_num);
% Mprob=0.01;
MPosition=rand((dim_num.*pop_num),1)<Mprob;
% A=min(offspring,[],2);
% B=max(offspring,[],2);
% range=repmat(((B-A)./pop_num),1,pop_num);
up=repmat(Cons( :, 2),1,pop_num);
low=repmat(Cons( :, 1),1,pop_num);
range=(up-low).*100;
MIndex=find(MPosition==1);
if ~isempty(MIndex)
    for i=1:length(MIndex)
        if rand<0.5
            sign=1;
        else
            sign=-1;
        end
        flag=0;
        flagIndex=[];
        while flag==0
            flagIndex=find((rand(1,16)<(1./16))==1);
            if ~isempty(flagIndex)
                flag=1;
            end
        end
        delta=0;
        for j=1:length(flagIndex)
            delta=delta+2.^(-(flagIndex(j)-1));
        end
        offspringTemp=offspring(MIndex(i))+sign.*range(MIndex(i)).*delta;
        upIndex =  up(MIndex(i))-offspringTemp;
        lowIndex = offspringTemp-low(MIndex(i));
        if upIndex<0
            offspringTemp=(offspring(MIndex(i))+up(MIndex(i)))./2;
        elseif lowIndex<0
            offspringTemp=(offspring(MIndex(i))+low(MIndex(i)))./2;
        end
        offspring(MIndex(i))=offspringTemp;
    end
end
end