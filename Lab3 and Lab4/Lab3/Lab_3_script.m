%%

h=4.25*(tf([1] ,[0.3 1])*tf([1], [22.5 1])*tf([1], [40 1]) );
[num den] = tfdata(h, 'v');
t632 = 66.6;
t28 = 32;

T = 1.5*(t632 - t28)
Tm= 1.5*(t28 - t632/3)
Kf=4.25

H_cc = tf([Kf], [T 1], 'iodelay', Tm)
%% CHR overdampted response

%P
P = (0.3*T)/(Tm*Kf)
SYSP = feedback(P*h, 1)

%PI
KpPI1 = (0.35*T)/(Tm * Kf);
TiPi1 = 1.2*Tm;
Hpi = KpPI1*(1 + tf(1, [TiPi1 0]))
SYS = feedback(Hpi*h,1)

% for PID
KpPID1 = (0.6*T)/(Tm * Kf);
TiPID1 = Tm;
TdPID1 = 0.5*Tm;


%% CHR overdampted response

%P
P = 0.3* T/(Tm *Kf)

%PI
KpPI1 = (0.6*T) / (Tm * Kf);
TiPi1 = 4*Tm;

Hpi = KpPI1*(1 + tf(1, [TiPi1 0]))
SYS = feedback(Hpi*h,1)

% for PID
KpPID1 = (0.95*T) / (Tm * Kf);
TiPID1 = 2.4*Tm;
TdPID1 = 0.42*Tm;

%% exercise 2
clear all
h = tf(3.3,[22 1], 'iodelay', 5)*tf([1], [11 1])
Tm = 5
Klim = 2.354
Tlim = 0.42

Kp = 0.5*Klim

Kpi = 0.45*Klim
Ti = 0.8*Tlim

Kpid = 0.75*Klim
TIpid = 0.6*Tlim
TDpid = 0.1*Tlim
