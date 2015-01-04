function offspring=DMutation(offspring,Cons)

[dim_num pop_num]=size(offspring);
Mprob=(1./dim_num);
% Mprob=0.01;
MPosition=rand((dim_num.*pop_num),1)<Mprob;
up=repmat(Cons( :, 2),1,pop_num);
low=repmat(Cons( :, 1),1,pop_num);
range=(up-low);
MIndex=find(MPosition==1);
if ~isempty(MIndex)
    for i=1:length(MIndex)
        offspringTemp=low(MIndex(i))+rand.*range(MIndex(i));
        upIndex = up(MIndex(i))-offspringTemp;
        lowIndex = offspringTemp-low(MIndex(i));
        if upIndex<0
            offspringTemp=(offspring(MIndex(i))+up(MIndex(i)))./2;
        elseif lowIndex<0
            offspringTemp=(offspring(MIndex(i))+low(MIndex(i)))./2;
        end
        offspring(MIndex(i))=offspringTemp;
    end
end