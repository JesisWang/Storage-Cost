% data=该文件下子文件中的xlsx表格内容
% data=data/1000;MWh
year=2018;
month=12;
day=16;
for i=1:length(data(:,1))
    if month>9
        if day>9
            eval(['XFxhdata.data',num2str(month),num2str(day),'=data(i,:);']);
        else
            eval(['XFxhdata.data',num2str(month),'0',num2str(day),'=data(i,:);']);
        end
    else
        if day>9
            eval(['XFxhdata.data','0',num2str(month),num2str(day),'=data(i,:);']);
        else
            eval(['XFxhdata.data','0',num2str(month),'0',num2str(day),'=data(i,:);']);
        end
    end
    day=day+1;
    if month==1 || month==3 || month==5 || month==7 || month==8 || month==10
        if day>31
            day=1;
            month=month+1;
        end
    elseif month==12
        if day>31
            day=1;
            month=1;
            year=year+1;
        end
    elseif month==4 || month==6 || month==9 || month==11
        if day>30
            day=1;
            month=month+1;
        end
    else
       if mod(year,4)==0
           % 闰年
           if day>29
               day=1;
               month=month+1;
           end
       else
           % 非闰年
           if day>28
               day=1;
               month=month+1;
           end
       end
    end
end
XFxhdata.specif='充电电量  放电电量  单位：MWh';
% save('D:\通用调频MATLAB计算文件\新丰电量数据\XFxhdata.mat','XFxhdata')