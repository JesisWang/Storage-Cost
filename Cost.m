% This file is for calculating the cost
% cost includes pay, operation cost and depreciation cost
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('D:\�·�AGC��Ƶ����ͳ��\XFdata.mat')
load('D:\ͨ�õ�ƵMATLAB�����ļ�\�·��������\XFxhdata.mat')
% load('D:\ͨ�õ�ƵMATLAB�����ļ�\�ƺӵ�������\YHxhdata.mat')
year=2018;% ��ʼ����
month=12;% ��ʼ����
day=16;% ��ʼ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�θ�����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NameDZ='XF';% ��վ����
NameF='xhdata.data';% �ļ�����
Nfile=fieldnames(eval([NameDZ,'xhdata']));% ͳ����ĸ���
CapBat=4.5;% MWh,ϵͳ�������·�,ͬ��,�ƺ�,ƽ˷����4.5MWh,�϶�9MWh
Pmax=9;% MW,���������ʣ��·�,ͬ��,�ƺ�,ƽ˷����9MW,�϶�18MW
Invest=1000;% ��Ԫ,Ͷ�ʳɱ�
ExpectCyc=5000;% ��,������Чѭ������
ExpectEngy=50000;% MWh,�����ŵ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nfile=length(Nfile);% ע���еĵط�����ע�ͺ�˵�������ų�
MBat=0;% ����۾ɳɱ�,money for depreciation cost
MOC=0;% ά���ɱ�,money for operation cost
MEP=0;% �����ɱ�,money for employee pay back
FDC=0;% �̶��۾ɳɱ�,fixed depreciation cost
Rate=Pmax/CapBat;% C,����
for i=1:Nfile-1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%���ʱ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
           % ����
           if day>29
               day=1;
               month=month+1;
           end
       else
           % ������
           if day>28
               day=1;
               month=month+1;
           end
       end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    data=eval(FileName);% ��������,�ַ�����ת����
    [hang,lie]=size(data);
    if lie>2
        Pbat=data(:,3)-data(:,2);% ���ش�������,�����������ݵ�
        DisE=sum(Pbat(Pbat(:,1)>0,1))*1/3600;
    else
        DisE=data(1,2);% ֻ�е�����
%     Cyc=data(i,1);% ��û�д�������ʱ��ֻ�е�Чѭ������ʱ��Ӧ�ò�ͬ����Դ
    end
    
%     Cyc=DisE/CapBat;
%     CCyc=Invest/ExpectCyc*Cyc;
%     CDE=Invest/ExpectEngy*DisE;
%     MBat=max(CCyc,CDE);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Mbat�����㷨%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    MBat=LCOS*DisE/10;% Ԫ/kwh*MWh*1000/10000=��Ԫ
    % �·��վ(60Ah):1.8Ԫ/wh��1800Ԫ/kwh,1800*4.5*1000=540��Ԫ,��λ���ʳɱ�:900Ԫ/kw
    % �϶���վ(40Ah):
    % ƽ˷��վ(40Ah):
    % �ƺӵ�վ(60Ah): = �·�
    % ͬ���վ(60Ah): = �·� 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    FileName1=['Cost',FileName];
    C=MBat+MOC+MEP+FDC;% ��Ԫ,�ɱ�(ע��ͳһ��λ)
    eval([FileName1,'=C;']);
    eval(['Cost',NameDZ,NameF,'(i,1)=C;']);
end