function [ParGen ObjVals G]=select(Par,Obj,G1,selectedNum)

[value index]=NSGA_Rank(Obj);
elite=index(1:selectedNum);
ParGen=Par(:,elite);
ObjVals=Obj(:,elite);
G=G1(:,elite);