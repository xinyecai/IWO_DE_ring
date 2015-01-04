% load '01-04.mat';
% load '05-08.mat';
% load '09-13.mat';
% f_min=[-15 -0.80361910412559 -1.00050010001000 -30665.53867178332 5126.4967140071 ...
%     -6961.81387558015 24.30620906818 -0.0958250414180359 680.630057374402 7049.24802052867 ...
%     0.7499000000 -1.0000000000 0.053941514041898 -47.7648884595 961.7150222899 -1.9051552586 ...
%     8853.5396748064 -0.8660254038 32.6555929502 0.2049794002 193.7245100700 236.4309755040 ...
%     -400.0551000000 -5.5080132716];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
temp1=FFE12;
if ismember(0, temp1)
    index1=find(temp1~=0)
    new_temp1=temp1(index1);
    z_min=min(new_temp1)
    z_median=median(new_temp1)
    z_mean=mean(new_temp1)
    z_max=max(new_temp1)
    z_std=std(new_temp1)
else
    z_min=min(temp1)
    z_median=median(temp1)
    z_mean=mean(temp1)
    z_max=max(temp1)
    z_std=std(temp1)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc;
% temp2=bestValues13;
% if ismember(inf, temp2)
%     index2=find(temp2~=inf);
%     new_temp2=temp2(index2);
%     y_min=min(new_temp2)
%     y_median=median(new_temp2)
%     y_mean=mean(new_temp2)
%     y_max=max(new_temp2)
%     y_std=std(new_temp2)
% else
%     y_min=min(temp2)
%     y_median=median(temp2)
%     y_mean=mean(temp2)
%     y_max=max(temp2)
%     y_std=std(temp2)
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nRun=31;
% median_run=median(1:nRun);
% problem=13;
% temp3=outcomeg13{median_run};
% min_new=min(temp3(1,:));
% if f_min(problem)>min_new
%     temp4=min_new;
% else
%     temp4=f_min(problem);
% end
% temp3(1,:)=temp3(1,:)-temp4;
% index3=find(temp3(1,:)>0);
% temp3=temp3(:,index3);
% temp3(1,:)=log10(temp3(1,:));
% n=size(temp3,2);
% if n>50
%     %%% ^ * x o %%%%
% %     a(4)=scatter(temp3(2,1:2:n), temp3(1,1:2:n),'bo');
% %     hold on;
%     step=round(n./50);
%     plot(temp3(2,1:step:n), temp3(1,1:step:n),'-');
% else
% %     a(4)=scatter(temp3(2,1:n), temp3(1,1:n),'bo');
% %     hod on;
%     plot(temp3(2,1:n), temp3(1,1:n),'-');
% end
% hold on;
% % legend(a,'g01','g02','g03','g04');