% clear all;
% close all;
format long;
format compact;
%%%%%%%%%%%%%%%%%%%%%%%
nRun=25;
f_min=[-15 -0.8036191042 -1.0000000000 -30665.5386717834 5126.498109595270 ...
    -6961.8138755802 24.3062090682 -0.0958250415 680.6300573745 7049.2480205286 ...
    0.75 -1.0000000000 0.0539498478 -47.7648884595 961.7150222899 -1.9051552586 ...
    8853.5396748064 -0.8660254038 32.6555929502 0.2049794002 193.7245100700 236.4309755040 ...
    -400.0551000000 -5.5080132716];
%% Benchmark Problems
%%%%%%%%%%%%%%%%%%%%%%
VarVals01=cell(nRun,1);
ObjVals01=cell(nRun,1);
outcome01=cell(nRun,1);
outcomeG01=cell(nRun,1);
FFE01=zeros(nRun,1);
bestValues01=zeros(nRun,1);
A=[];
for i=1:nRun
[g01VarVals, g01ObjVals,outcome1,FFEerror,outcomeG1] = ...
  main( 20, 'g01', [0,1;0,1;0,1;0,1;0,1;0,1;0,1;0,1;0,1;0,100;0,100;0,100;0,1],A,f_min(1));
bestIndex=find(g01ObjVals(2,:)==0);
 if(isempty(bestIndex))
     bestValue=inf;
 else
     bestValue=min(g01ObjVals(1,bestIndex));
 end
 VarVals01{i}=g01VarVals;
 ObjVals01{i}=g01ObjVals;
 bestValues01(i)=bestValue;
 FFE01(i)=FFEerror;
 outcome01{i}=outcome1;
 outcomeG01{i}=outcomeG1;
 fprintf( 'run= %d\n', i);
end
fprintf( 'g01\n');
%%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals02=cell(nRun,1);
% ObjVals02=cell(nRun,1);
% outcome02=cell(nRun,1);
% outcomeG02=cell(nRun,1);
% FFE02=zeros(nRun,1);
% bestValues02=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g02VarVals, g02ObjVals,outcome2,FFEerror,outcomeG2] = ...
%   main( 20, 'g02',repmat( [0 10], 20, 1),A,f_min(2));
%  bestIndex=find(g02ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g02ObjVals(1,bestIndex));
%  end
%  VarVals02{i}=g02VarVals;
%  ObjVals02{i}=g02ObjVals;
%  outcome02{i}=outcome2;
%  FFE02(i)=FFEerror;
%  bestValues02(i)=bestValue;
%  outcomeG02{i}=outcomeG2;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g02\n');
% %%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals03=cell(nRun,1);
% ObjVals03=cell(nRun,1);
% outcome03=cell(nRun,1);
% outcomeG03=cell(nRun,1);
% FFE03=zeros(nRun,1);
% bestValues03=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g03VarVals, g03ObjVals,outcome3,FFEerror,outcomeG3] = ...
%   main( 20, 'g03', repmat( [0 1], 10, 1),A,f_min(3));
% bestIndex=find(g03ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g03ObjVals(1,bestIndex));
%  end
%  VarVals03{i}=g03VarVals;
%  ObjVals03{i}=g03ObjVals;
%  outcome03{i}=outcome3;
%  FFE03(i)=FFEerror;
%  bestValues03(i)=bestValue;
%  outcomeG03{i}=outcomeG3;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g03\n');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals04=cell(nRun,1);
% ObjVals04=cell(nRun,1);
% outcome04=cell(nRun,1);
% outcomeG04=cell(nRun,1);
% FFE04=zeros(nRun,1);
% bestValues04=zeros(nRun,1);
% A=[];
% for i=1:nRun
%  [g04VarVals, g04ObjVals,outcome4,FFEerror,outcomeG4] = ...
%   main( 20, 'g04',[78,102;33,45;27,45;27,45;27,45],A,f_min(4));
% bestIndex=find(g04ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g04ObjVals(1,bestIndex));
%  end
%  VarVals04{i}=g04VarVals;
%  ObjVals04{i}=g04ObjVals;
%  outcome04{i}=outcome4;
%  FFE04(i)=FFEerror;
%  bestValues04(i)=bestValue;
%  outcomeG04{i}=outcomeG4;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g04\n');
% %%%%%%%%%%%%%%%%%%
% VarVals05=cell(nRun,1);
% ObjVals05=cell(nRun,1);
% outcome05=cell(nRun,1);
% outcomeG05=cell(nRun,1);
% FFE05=zeros(nRun,1);
% bestValues05=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g05VarVals, g05ObjVals,outcome5,FFEerror,outcomeG5] = ...
%   main(20, 'g05', [0,1200;0,1200;-0.55,0.55;-0.55,0.55],A,f_min(5));
% bestIndex=find(g05ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g05ObjVals(1,bestIndex));
%  end
%  VarVals05{i}=g05VarVals;
%  ObjVals05{i}=g05ObjVals;
%  outcome05{i}=outcome5;
%  FFE05(i)=FFEerror;
%  bestValues05(i)=bestValue;
%  outcomeG05{i}=outcomeG5;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g05\n');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals06=cell(nRun,1);
% ObjVals06=cell(nRun,1);
% outcome06=cell(nRun,1);
% outcomeG06=cell(nRun,1);
% FFE06=zeros(nRun,1);
% bestValues06=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g06VarVals, g06ObjVals,outcome6,FFEerror,outcomeG6] = ...
%   main( 20, 'g06', [13,100;0,100],A,f_min(6));
% bestIndex=find(g06ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g06ObjVals(1,bestIndex));
%  end
%  VarVals06{i}=g06VarVals;
%  ObjVals06{i}=g06ObjVals;
%  outcome06{i}=outcome6;
%   FFE06(i)=FFEerror;
%  bestValues06(i)=bestValue;
%  outcomeG06{i}=outcomeG6;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g06\n');
% %%%%%%%%%%%%%%%%
% VarVals07=cell(nRun,1);
% ObjVals07=cell(nRun,1);
% outcome07=cell(nRun,1);
% outcomeG07=cell(nRun,1);
% FFE07=zeros(nRun,1);
% bestValues07=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g07VarVals, g07ObjVals,outcome7,FFEerror,outcomeG7] = ...
%   main( 20, 'g07', repmat( [-10 10], 10, 1),A,f_min(7));
% bestIndex=find(g07ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g07ObjVals(1,bestIndex));
%  end
%  VarVals07{i}=g07VarVals;
%  ObjVals07{i}=g07ObjVals;
%  outcome07{i}=outcome7;
%  FFE07(i)=FFEerror;
%  bestValues07(i)=bestValue;
%  outcomeG07{i}=outcomeG7;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g07\n');
% %%%%%%%%%%%%%%%%%%%
% VarVals08=cell(nRun,1);
% ObjVals08=cell(nRun,1);
% outcome08=cell(nRun,1);
% outcomeG08=cell(nRun,1);
% FFE08=zeros(nRun,1);
% bestValues08=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g08VarVals, g08ObjVals,outcome8,FFEerror,outcomeG8] = ...
%   main( 20, 'g08', [0,10;0,10],A,f_min(8));
% bestIndex=find(g08ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g08ObjVals(1,bestIndex));
%  end
%  VarVals08{i}=g08VarVals;
%  ObjVals08{i}=g08ObjVals;
%  outcome08{i}=outcome8;
%  FFE08(i)=FFEerror;
%  bestValues08(i)=bestValue;
%  outcomeG08{i}=outcomeG8;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g08\n');
%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals09=cell(nRun,1);
% ObjVals09=cell(nRun,1);
% outcome09=cell(nRun,1);
% outcomeG09=cell(nRun,1);
% FFE09=zeros(nRun,1);
% bestValues09=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g09VarVals, g09ObjVals,outcome9,FFEerror,outcomeG9] = ...
%   main( 20, 'g09',repmat( [-10 10], 7, 1),A,f_min(9));
% bestIndex=find(g09ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g09ObjVals(1,bestIndex));
%  end
%  VarVals09{i}=g09VarVals;
%  ObjVals09{i}=g09ObjVals;
%  outcome09{i}=outcome9;
%   FFE09(i)=FFEerror;
%  bestValues09(i)=bestValue;
%  outcomeG09{i}=outcomeG9;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g09\n');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals10=cell(nRun,1);
% ObjVals10=cell(nRun,1);
% outcomeg10=cell(nRun,1);
% outcomeG10=cell(nRun,1);
% FFE10=zeros(nRun,1);
% bestValues10=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g10VarVals, g10ObjVals,outcome10,FFEerror,outcomeG010] = ...
%   main( 20, 'g10', [100,10000;1000,10000;1000,10000;10,1000;10,1000;10,1000;10,1000;10,1000],A,f_min(10));
% bestIndex=find(g10ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g10ObjVals(1,bestIndex));
%  end
%  VarVals10{i}=g10VarVals;
%  ObjVals10{i}=g10ObjVals;
%  outcomeg10{i}=outcome10;
%   FFE10(i)=FFEerror;
%  bestValues10(i)=bestValue;
%  outcomeG10{i}=outcomeG010;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g10\n');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals11=cell(nRun,1);
% ObjVals11=cell(nRun,1);
% outcomeg11=cell(nRun,1);
% outcomeG11=cell(nRun,1);
% FFE11=zeros(nRun,1);
% bestValues11=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g11VarVals, g11ObjVals,outcome11,FFEerror,outcomeG011] = ...
%   main( 20, 'g11', [-1,1;-1,1],A,f_min(11));
% bestIndex=find(g11ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g11ObjVals(1,bestIndex));
%  end
%  VarVals11{i}=g11VarVals;
%  ObjVals11{i}=g11ObjVals;
%  outcomeg11{i}=outcome11;
%   FFE11(i)=FFEerror;
%  bestValues11(i)=bestValue;
%  outcomeG11{i}=outcomeG011;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g11\n');
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals12=cell(nRun,1);
% ObjVals12=cell(nRun,1);
% outcomeg12=cell(nRun,1);
% outcomeG12=cell(nRun,1);
% FFE12=zeros(nRun,1);
% bestValues12=zeros(nRun,1);
% l = 1;
% for i = 1 : 9
%     for j = 1 : 9
%         for k = 1 : 9
%             A(l,  : ) = [i j k];
%             l = l+1;
%         end
%     end
% end
% for i=1:nRun
% [g12VarVals, g12ObjVals,outcome12,FFEerror,outcomeG012] = ...
%   main( 20, 'g12',[0,10;0,10;0,10],A,f_min(12));
% bestIndex=find(g12ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g12ObjVals(1,bestIndex));
%  end
%  VarVals12{i}=g12VarVals;
%  ObjVals12{i}=g12ObjVals;
%  outcomeg12{i}=outcome12;
%   FFE12(i)=FFEerror;
%  bestValues12(i)=bestValue;
%  outcomeG12{i}=outcomeG012;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g12\n');
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VarVals13=cell(nRun,1);
% ObjVals13=cell(nRun,1);
% outcomeg13=cell(nRun,1);
% outcomeG13=cell(nRun,1);
% FFE13=zeros(nRun,1);
% bestValues13=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g13VarVals, g13ObjVals,outcome13,FFEerror,outcomeG013] = ...
%   main( 20, 'g13',[-2.3,2.3;-2.3,2.3;-3.2,3.2;-3.2,3.2;-3.2,3.2],A,f_min(13));
% bestIndex=find(g13ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g13ObjVals(1,bestIndex));
%  end
%  VarVals13{i}=g13VarVals;
%  ObjVals13{i}=g13ObjVals;
%  outcomeg13{i}=outcome13;
%  FFE13(i)=FFEerror;
%  bestValues13(i)=bestValue;
%  outcomeG13{i}=outcomeG013;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g13\n');
% %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals14=cell(nRun,1);
% ObjVals14=cell(nRun,1);
% outcomeg14=cell(nRun,1);
% outcomeG14=cell(nRun,1);
% FFE14=zeros(nRun,1);
% bestValues14=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g14VarVals, g14ObjVals,outcome14,FFEerror,outcomeG014] = ...
%   main( 20, 'g14',repmat( [0 10], 10, 1),A,f_min(14));
% bestIndex=find(g14ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g14ObjVals(1,bestIndex));
%  end
%  VarVals14{i}=g14VarVals;
%  ObjVals14{i}=g14ObjVals;
%  outcomeg14{i}=outcome14;
%  FFE14(i)=FFEerror;
%  bestValues14(i)=bestValue;
%  outcomeG14{i}=outcomeG014;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g14\n');
% % %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals15=cell(nRun,1);
% ObjVals15=cell(nRun,1);
% outcomeg15=cell(nRun,1);
% outcomeG15=cell(nRun,1);
% FFE15=zeros(nRun,1);
% bestValues15=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g15VarVals, g15ObjVals,outcome15,FFEerror,outcomeG015] = ...
%   main( 20, 'g15',repmat( [0 10], 3, 1),A,f_min(15));
% bestIndex=find(g15ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g15ObjVals(1,bestIndex));
%  end
%  VarVals15{i}=g15VarVals;
%  ObjVals15{i}=g15ObjVals;
%  outcomeg15{i}=outcome15;
%   FFE15(i)=FFEerror;
%  bestValues15(i)=bestValue;
%  outcomeG15{i}=outcomeG015;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g15\n');
% %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals16=cell(nRun,1);
% ObjVals16=cell(nRun,1);
% outcomeg16=cell(nRun,1);
% outcomeG16=cell(nRun,1);
% FFE16=zeros(nRun,1);
% bestValues16=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g16VarVals, g16ObjVals,outcome16,FFEerror,outcomeG016] = ...
%   main( 20, 'g16',[704.4148 906.3855; 68.6 288.88; 0 134.75; 193 287.0966; 25 84.1988],A,f_min(16));
% bestIndex=find(g16ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g16ObjVals(1,bestIndex));
%  end
%  VarVals16{i}=g16VarVals;
%  ObjVals16{i}=g16ObjVals;
%  outcomeg16{i}=outcome16;
%   FFE16(i)=FFEerror;
%  bestValues16(i)=bestValue;
%  outcomeG16{i}=outcomeG016;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g16\n');
% %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals17=cell(nRun,1);
% ObjVals17=cell(nRun,1);
% outcomeg17=cell(nRun,1);
% outcomeG17=cell(nRun,1);
% FFE17=zeros(nRun,1);
% bestValues17=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g17VarVals, g17ObjVals,outcome17,FFEerror,outcomeG017] = ...
%   main( 20, 'g17',[0 400; 0 1000; 340 420; 340 420; -1000 1000; 0 0.5236],A,f_min(17));
% bestIndex=find(g17ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g17ObjVals(1,bestIndex));
%  end
%  VarVals17{i}=g17VarVals;
%  ObjVals17{i}=g17ObjVals;
%  outcomeg17{i}=outcome17;
%    FFE17(i)=FFEerror;
%  bestValues17(i)=bestValue;
%  outcomeG17{i}=outcomeG017;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g17\n');
% %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals18=cell(nRun,1);
% ObjVals18=cell(nRun,1);
% outcomeg18=cell(nRun,1);
% outcomeG18=cell(nRun,1);
% FFE18=zeros(nRun,1);
% bestValues18=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g18VarVals, g18ObjVals,outcome18,FFEerror,outcomeG018] = ...
%   main( 20, 'g18',[repmat( [-10 10], 8, 1); 0 20],A,f_min(18));
% bestIndex=find(g18ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g18ObjVals(1,bestIndex));
%  end
%  VarVals18{i}=g18VarVals;
%  ObjVals18{i}=g18ObjVals;
%  outcomeg18{i}=outcome18;
%    FFE18(i)=FFEerror;
%  bestValues18(i)=bestValue;
%  outcomeG18{i}=outcomeG018;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g18\n');
% %%%%%%%%%%%%%%%%%%%%%%
% VarVals19=cell(nRun,1);
% ObjVals19=cell(nRun,1);
% outcomeg19=cell(nRun,1);
% outcomeG19=cell(nRun,1);
% FFE19=zeros(nRun,1);
% bestValues19=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g19VarVals, g19ObjVals,outcome19,FFEerror,outcomeG019] = ...
%   main( 20, 'g19',repmat( [0 10], 15, 1),A,f_min(19));
% bestIndex=find(g19ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g19ObjVals(1,bestIndex));
%  end
%  VarVals19{i}=g19VarVals;
%  ObjVals19{i}=g19ObjVals;
%  outcomeg19{i}=outcome19;
%  FFE19(i)=FFEerror;
%  bestValues19(i)=bestValue;
%  outcomeG19{i}=outcomeG019;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g19\n');
% %%%%%%%%%%%%%%%%%%%%%%%
% VarVals20=cell(nRun,1);
% ObjVals20=cell(nRun,1);
% outcomeg20=cell(nRun,1);
% outcomeG20=cell(nRun,1);
% FFE20=zeros(nRun,1);
% bestValues20=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g20VarVals, g20ObjVals,outcome20,FFEerror,outcomeG020] = ...
%   main( 20, 'g20',repmat( [0 10], 24, 1),A,f_min(20));
% bestIndex=find(g20ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g20ObjVals(1,bestIndex));
%  end
%  VarVals20{i}=g20VarVals;
%  ObjVals20{i}=g20ObjVals;
%  outcomeg20{i}=outcome20;
%  FFE20(i)=FFEerror;
%  bestValues20(i)=bestValue;
%  outcomeG20{i}=outcomeG020;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g20\n');
% %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals21=cell(nRun,1);
% ObjVals21=cell(nRun,1);
% outcomeg21=cell(nRun,1);
% outcomeG21=cell(nRun,1);
% FFE21=zeros(nRun,1);
% bestValues21=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g21VarVals, g21ObjVals,outcome21,FFEerror,outcomeG021] = ...
%   main( 20, 'g21',[0 1000; 0 400; 0 40; 100 300; 6.3 6.7; 5.9 6.4; 4.5 6.25],A,f_min(21));
% bestIndex=find(g21ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g21ObjVals(1,bestIndex));
%  end
%  VarVals21{i}=g21VarVals;
%  ObjVals21{i}=g21ObjVals;
%  outcomeg21{i}=outcome21;
%   FFE21(i)=FFEerror;
%  bestValues21(i)=bestValue;
%  outcomeG21{i}=outcomeG021;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g21\n');
% % %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals22=cell(nRun,1);
% ObjVals22=cell(nRun,1);
% outcomeg22=cell(nRun,1);
% outcomeG22=cell(nRun,1);
% FFE22=zeros(nRun,1);
% bestValues22=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g22VarVals, g22ObjVals,outcome22,FFEerror,outcomeG022] = ...
%   main( 20, 'g22',[0 20000; repmat( [0 1e6], 3, 1); repmat( [0 4e7], 3, 1); 100 299.99; 100 399.99; 100.01 300; 100 400; 100 600; repmat( [0 500], 3, 1); 0.01 300; 0.01 400; repmat( [-4.7 6.25], 5, 1)],A,f_min(22));
% bestIndex=find(g22ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g22ObjVals(1,bestIndex));
%  end
%  VarVals22{i}=g22VarVals;
%  ObjVals22{i}=g22ObjVals;
%  outcomeg22{i}=outcome22;
%   FFE22(i)=FFEerror;
%  bestValues22(i)=bestValue;
%  outcomeG22{i}=outcomeG022;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g22\n');
% %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals23=cell(nRun,1);
% ObjVals23=cell(nRun,1);
% outcomeg23=cell(nRun,1);
% outcomeG23=cell(nRun,1);
% FFE23=zeros(nRun,1);
% bestValues23=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g23VarVals, g23ObjVals,outcome23,FFEerror,outcomeG023] = ...
%   main( 20, 'g23',[0 300; 0 300; 0 100; 0 200; 0 100; 0 300; 0 100; 0 200; 0.01 0.03],A,f_min(23));
% bestIndex=find(g23ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g23ObjVals(1,bestIndex));
%  end
%  VarVals23{i}=g23VarVals;
%  ObjVals23{i}=g23ObjVals;
%  outcomeg23{i}=outcome23;
%   FFE23(i)=FFEerror;
%  bestValues23(i)=bestValue;
%  outcomeG23{i}=outcomeG023;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g23\n');
% % %%%%%%%%%%%%%%%%%%%%%%%%
% VarVals24=cell(nRun,1);
% ObjVals24=cell(nRun,1);
% outcomeg24=cell(nRun,1);
% outcomeG24=cell(nRun,1);
% FFE24=zeros(nRun,1);
% bestValues24=zeros(nRun,1);
% A=[];
% for i=1:nRun
% [g24VarVals, g24ObjVals,outcome24,FFEerror,outcomeG024] = ...
%   main( 20, 'g24',[0 3; 0 4],A,f_min(24));
% bestIndex=find(g24ObjVals(2,:)==0);
%  if(isempty(bestIndex))
%      bestValue=inf;
%  else
%      bestValue=min(g24ObjVals(1,bestIndex));
%  end
%  VarVals24{i}=g24VarVals;
%  ObjVals24{i}=g24ObjVals;
%  outcomeg24{i}=outcome24;
%   FFE24(i)=FFEerror;
%  bestValues24(i)=bestValue;
%   outcomeG24{i}=outcomeG024;
%  fprintf( 'run= %d\n', i);
% end
% fprintf( 'g24\n');



fprintf( 'Game Over\n');
save('test.mat');

