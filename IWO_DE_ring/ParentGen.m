function ParGen0 = ParentGen( nmbOfIndivs, Cons)

[nmbOfVars foo] = size(Cons);
ParGen0=Cons(:,1)*ones(1,nmbOfIndivs)+((Cons(:,2)-Cons(:,1))*ones(1,nmbOfIndivs)).*rand(nmbOfVars,nmbOfIndivs);