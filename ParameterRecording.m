% This file is for recording the parameters of LCOS
%% �·ᣨ����60Ah��
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900Ԫ/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%����ά���ã��ݶ�
%     DoD=1;          % Depth of doscharge,                   �����ŵ�Чѭ������100%
%     c=6*365;        % Number of cycles per year,            6��/��
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000��ѭ��
%     DEG=1-(80/100).^(1/N); % Annual degradation:            �꽵����
%     r=0.1;          % Discount rate,                        �ݶ����۾��ʣ�
%     Pelec=0.2829;   % RMB/kwh,Charging cost,                ��λ���
%     yita=0.8642;    % Round-trip efficiency,                ѭ��Ч��
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                �ݶ���ʣ���ֵ
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% Ԫ/kwh*MWh*1000/10000=~~��Ԫ
%     % DEGΪ��ƽ������:100%*(1-DEG).^N=80%
%% �϶�������40Ah��
%     CAPEX=900*18000;% RMB/kW*(rated power),Capital expenses,900Ԫ/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%����ά���ã��ݶ�
%     DoD=1;          % Depth of doscharge,                   �����ŵ�Чѭ������100%
%     c=?*365;        % Number of cycles per year,            ?��/��
%     RC=9000;        % kWh,Rated capacity:                   9000kWh
%     N=5000/c;       % year,Lifetime of system,              5000��ѭ��
%     DEG=1-(80/100).^(1/N); % Annual degradation:            �꽵����
%     r=0.1;          % Discount rate,                        �ݶ����۾��ʣ�
%     Pelec=      ;   % RMB/kwh,Charging cost,                ��λ���
%     yita=0.8755;    % Round-trip efficiency,                ѭ��Ч��
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                �ݶ���ʣ���ֵ
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% Ԫ/kwh*MWh*1000/10000=~~��Ԫ
%% ƽ˷������40Ah��
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900Ԫ/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%����ά���ã��ݶ�
%     DoD=1;          % Depth of doscharge,                   �����ŵ�Чѭ������100%
%     c=?*365;        % Number of cycles per year,            ?��/��
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000��ѭ��
%     DEG=1-(80/100).^(1/N); % Annual degradation:            �꽵����
%     r=0.1;          % Discount rate,                        �ݶ����۾��ʣ�
%     Pelec=      ;   % RMB/kwh,Charging cost,                ��λ���
%     yita=0.9016;    % Round-trip efficiency,                ѭ��Ч��
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                �ݶ���ʣ���ֵ
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% Ԫ/kwh*MWh*1000/10000=~~��Ԫ
%% �ƺӣ�����60Ah��
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900Ԫ/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%����ά���ã��ݶ�
%     DoD=1;          % Depth of doscharge,                   �����ŵ�Чѭ������100%
%     c=?*365;        % Number of cycles per year,            ?��/��
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000��ѭ��
%     DEG=1-(80/100).^(1/N); % Annual degradation:            �꽵����
%     r=0.1;          % Discount rate,                        �ݶ����۾��ʣ�
%     Pelec=      ;   % RMB/kwh,Charging cost,                ��λ���
%     yita=0.8642;    % Round-trip efficiency,                ѭ��Ч��
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                �ݶ���ʣ���ֵ
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% Ԫ/kwh*MWh*1000/10000=~~��Ԫ
%% ͬ�����60Ah��
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900Ԫ/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%����ά���ã��ݶ�
%     DoD=1;          % Depth of doscharge,                   �����ŵ�Чѭ������100%
%     c=?*365;        % Number of cycles per year,            ?��/��
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000��ѭ��
%     DEG=1-(80/100).^(1/N); % Annual degradation:            �꽵����
%     r=0.1;          % Discount rate,                        �ݶ����۾��ʣ�
%     Pelec=      ;   % RMB/kwh,Charging cost,                ��λ���
%     yita=0.8642;    % Round-trip efficiency,                ѭ��Ч��
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                �ݶ���ʣ���ֵ
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% Ԫ/kwh*MWh*1000/10000=~~��Ԫ