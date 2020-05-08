h=4.25*(tf([1] ,[0.3 1])*tf([1], [22.5 1])*tf([1], [40 1]) );

H=tf([4.25], [33.03*60 1], 'InputDelay', 15.69*60)
T=52.035*60
Tm=15.69*60
Kf=4.25;
%% Ziegler Nichols

%P
KpP1 = T / (Tm * Kf);


%PI
KpPI1 = 0.9*T / (Tm * Kf);
TiPi1 = 3.3*Tm;


% for PID
KpPID1 = 1.2*T / (Tm * Kf);
TiPID1 = 2*Tm;
TdPID1 = 0.5*Tm;


%% Kopelovici

% for P
KpP2 = 0.3*T / (Tm * Kf);


% for PI
KpPI2 = 0.6*T / (Tm * Kf);
TiPI2 = 0.8*Tm + 0.5*T;


% for PID
KpPID2 = 0.95*T / (Tm * Kf);
TiPID2 = 2*Tm;
TdPID2 = 0.4*Tm;

