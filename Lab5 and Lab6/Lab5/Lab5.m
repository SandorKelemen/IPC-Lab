Kf=4.3;
T1=5;
T2=23;
Tm=2.5;

Hf = Kf*tf(1,[T1 1])*tf(1,[T2 1])*tf(1,1,'iodelay',Tm)

Ts = Tm/4;

Ts=Tm/4;
Hf1z=c2d(Hf,Ts,'zoh')
Tmd = 4
[n,d]=tfdata(Hf1z,'v');
Hf1zz=tf(n,d,Ts,'Variable','z^-1','Iodelay',4);
K=sum(n);

Hf1zzamp=tf(1/K*n,1/K*d,Ts,'Variable','z^-1','Iodelay',4)
[p,q]=tfdata(Hf1zzamp,'v');

Hkc1=tf(q, [1, zeros(1, length(p)-1 + 4)] - [zeros(1, Tmd), p], Ts,'Variable','z^-1')
[q1, p1] = tfdata(Hkc1, 'v')

zpk(Hkc1)
Hkc2=tf(q,[1.707 -1.207 0.8541 -0.605 0.427 -1.176],Ts,'Variable','z^-1')
[qk2, pk2]=tfdata(Hkc2,'v');

Hkc3=tf(q,[5.487 -5.487],Ts,'Variable', 'z^-1')

[qk3, pk3]=tfdata(Hkc3,'v');

%stepinfo(simout.Data, simout.Time)