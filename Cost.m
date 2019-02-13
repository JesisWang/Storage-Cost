% This file is for calculating the cost
% cost includes pay, operation cost and depreciation cost
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%更改项%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('D:\新丰AGC调频数据统计\XFdata.mat')
load('D:\通用调频MATLAB计算文件\新丰电量数据\XFxhdata.mat')
% load('D:\通用调频MATLAB计算文件\云河电量数据\YHxhdata.mat')
year=2018;% 起始日期
month=12;% 起始日期
day=16;% 起始日期
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%次更改项%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NameDZ='XF';% 电站代号
NameF='xhdata.data';% 文件代号
Nfile=fieldnames(eval([NameDZ,'xhdata']));% 统计域的个数
CapBat=4.5;% MWh,系统容量：新丰,同达,云河,平朔都是4.5MWh,上都9MWh
Pmax=9;% MW,最大出力功率：新丰,同达,云河,平朔都是9MW,上都18MW
Invest=1000;% 万元,投资成本
ExpectCyc=5000;% 次,期望等效循环次数
ExpectEngy=50000;% MWh,期望放电电量
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nfile=length(Nfile);% 注意有的地方存在注释和说明，需排除
MBat=0;% 电池折旧成本,money for depreciation cost
MOC=0;% 维护成本,money for operation cost
MEP=0;% 人力成本,money for employee pay back
FDC=0;% 固定折旧成本,fixed depreciation cost
Rate=Pmax/CapBat;% C,倍率
for i=1:Nfile-1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%变更时间%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if month>9
        if day>9
            FileName=[NameDZ,NameF,num2str(month),num2str(day)];
        else
            FileName=[NameDZ,NameF,num2str(month),'0',num2str(day)];
        end
    else
        if day>9
            FileName=[NameDZ,NameF,'0',num2str(month),num2str(day)];
        else
            FileName=[NameDZ,NameF,'0',num2str(month),'0',num2str(day)];
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    data=eval(FileName);% 加载数据,字符变量转换器
    [hang,lie]=size(data);
    if lie>2
        Pbat=data(:,3)-data(:,2);% 加载储能数据,存在完整数据的
        DisE=sum(Pbat(Pbat(:,1)>0,1))*1/3600;
    else
        DisE=data(1,2);% 只有电量的
%     Cyc=data(i,1);% 当没有储能数据时，只有等效循环次数时，应用不同数据源
    end
    
%     Cyc=DisE/CapBat;
%     CCyc=Invest/ExpectCyc*Cyc;
%     CDE=Invest/ExpectEngy*DisE;
%     MBat=max(CCyc,CDE);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Mbat国际算法%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % BTM = Behind-the-Meter Use
    % ITM = In-Front-of-the-Meter Use
    % BTM is the method applied for Residential and Commerical Case
    % ITM is the method applied for Microgrid, Distribution and Peaker
    % Replacement case
    % Therefor our storage station is ITM method. 
    CAPEX=900*9000; % USD/kW*(rated power),Capital expenses,ITM is 500,BTM is 1000
    OM=0.02*CAPEX;  % USD/kW,Operating and maintenance cost,ITM is 0.02,BTM is 0
    DoD=1;          % Depth of doscharge,                   ITM is 0.8,BTM is 1
    c=6*365;        % Number of cycles per year,            ITM is 350,BTM is 250
    RC=4500;        % kWh,Rated capacity:                   ITM is 1.5MW/6MWh,BTM is 5kW/10kWh
    N=5000/c;       % year,Lifetime of system,              ITM is 15,BTM is 15
    DEG=1-(80/100).^(1/N); % Annual degradation:            ITM is 0.123,BTM is 0.0716
    r=0.1;          % Discount rate,                        ITM is 0.1,BTM is 0.03
    Pelec=0.2829;   % USD/kwh,Charging cost,                ITM is 0.06,BTM is 0.12
    yita=0.8642;    % Round-trip efficiency,                ITM is 0.92,BTM is 0.7
    v=0.2*CAPEX;    % USD/kW,Residual value,                ITM is 0.2.BTM is 0
    Var1=0;         % medium Variable
    Var2=0;         % medium Variable
    for j=1:ceil(N)
        Var1=1/((1+r).^j)+Var1;
        Var2=Var2+(1-DEG*j)/((1+r).^j);
    end
    LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
    % USD/kwh,Levelized Cost of Storage
    MBat=LCOS*DisE/10;% 元/kwh*MWh*1000/10000=万元
    % 新丰电站(60Ah):1.8元/wh即1800元/kwh,1800*4.5*1000=540万元,单位功率成本:900元/kw
    % 上都电站(40Ah):
    % 平朔电站(40Ah):
    % 云河电站(60Ah): = 新丰
    % 同达电站(60Ah): = 新丰 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    FileName1=['Cost',FileName];
    C=MBat+MOC+MEP+FDC;% 万元,成本(注意统一单位)
    eval([FileName1,'=C;']);
    eval(['Cost',NameDZ,NameF,'(i,1)=C;']);
end