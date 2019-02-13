% This file is for recording the parameters of LCOS
%% 新丰（国能60Ah）
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900元/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%的运维费用，暂定
%     DoD=1;          % Depth of doscharge,                   按满放等效循环次数100%
%     c=6*365;        % Number of cycles per year,            6周/天
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000周循环
%     DEG=1-(80/100).^(1/N); % Annual degradation:            年降解率
%     r=0.1;          % Discount rate,                        暂定（折旧率）
%     Pelec=0.2829;   % RMB/kwh,Charging cost,                单位电费
%     yita=0.8642;    % Round-trip efficiency,                循环效率
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                暂定，剩余价值
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% 元/kwh*MWh*1000/10000=~~万元
%     % DEG为年平均降解:100%*(1-DEG).^N=80%
%% 上都（科能40Ah）
%     CAPEX=900*18000;% RMB/kW*(rated power),Capital expenses,900元/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%的运维费用，暂定
%     DoD=1;          % Depth of doscharge,                   按满放等效循环次数100%
%     c=?*365;        % Number of cycles per year,            ?周/天
%     RC=9000;        % kWh,Rated capacity:                   9000kWh
%     N=5000/c;       % year,Lifetime of system,              5000周循环
%     DEG=1-(80/100).^(1/N); % Annual degradation:            年降解率
%     r=0.1;          % Discount rate,                        暂定（折旧率）
%     Pelec=      ;   % RMB/kwh,Charging cost,                单位电费
%     yita=0.8755;    % Round-trip efficiency,                循环效率
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                暂定，剩余价值
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% 元/kwh*MWh*1000/10000=~~万元
%% 平朔（国能40Ah）
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900元/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%的运维费用，暂定
%     DoD=1;          % Depth of doscharge,                   按满放等效循环次数100%
%     c=?*365;        % Number of cycles per year,            ?周/天
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000周循环
%     DEG=1-(80/100).^(1/N); % Annual degradation:            年降解率
%     r=0.1;          % Discount rate,                        暂定（折旧率）
%     Pelec=      ;   % RMB/kwh,Charging cost,                单位电费
%     yita=0.9016;    % Round-trip efficiency,                循环效率
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                暂定，剩余价值
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% 元/kwh*MWh*1000/10000=~~万元
%% 云河（国能60Ah）
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900元/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%的运维费用，暂定
%     DoD=1;          % Depth of doscharge,                   按满放等效循环次数100%
%     c=?*365;        % Number of cycles per year,            ?周/天
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000周循环
%     DEG=1-(80/100).^(1/N); % Annual degradation:            年降解率
%     r=0.1;          % Discount rate,                        暂定（折旧率）
%     Pelec=      ;   % RMB/kwh,Charging cost,                单位电费
%     yita=0.8642;    % Round-trip efficiency,                循环效率
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                暂定，剩余价值
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% 元/kwh*MWh*1000/10000=~~万元
%% 同达（国能60Ah）
%     CAPEX=900*9000; % RMB/kW*(rated power),Capital expenses,900元/kW
%     OM=0.02*CAPEX;  % RMB/kW,Operating and maintenance cost,2%的运维费用，暂定
%     DoD=1;          % Depth of doscharge,                   按满放等效循环次数100%
%     c=?*365;        % Number of cycles per year,            ?周/天
%     RC=4500;        % kWh,Rated capacity:                   4500kWh
%     N=5000/c;       % year,Lifetime of system,              5000周循环
%     DEG=1-(80/100).^(1/N); % Annual degradation:            年降解率
%     r=0.1;          % Discount rate,                        暂定（折旧率）
%     Pelec=      ;   % RMB/kwh,Charging cost,                单位电费
%     yita=0.8642;    % Round-trip efficiency,                循环效率
%     v=0.2*CAPEX;    % RMB/kW,Residual value,                暂定，剩余价值
%     Var1=0;         % medium Variable
%     Var2=0;         % medium Variable
%     for j=1:ceil(N)
%         Var1=1/((1+r).^j)+Var1;
%         Var2=Var2+(1-DEG*j)/((1+r).^j);
%     end
%     LCOS=(CAPEX+OM*Var1-v/(1+r).^(N+1))/(c*DoD*RC*Var2)+Pelec/yita;
%     % RMB/kwh,Levelized Cost of Storage
%     % Mbat=LCOS*DisE*/10;% 元/kwh*MWh*1000/10000=~~万元