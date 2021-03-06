Hf=tf(4.3,conv([5*60,1],[23*60,1]),'iodelay',2.5*60)
Ts1 = 5*60;
Ts2 = 23*60;
Tm = 2.5*60

%sampling time
Ts = Ts1/10;

Hf_z = c2d(Hf,Ts,'zoh');
[num,den] = tfdata(Hf_z,'v')

Hf_zz = tf(num,den,Ts,'Variable','z^-1','IoDelay',1)
Hf_zz_inv = tf(num,den,Ts,'Variable','z^-1')

T0 = (Ts1+Ts2)/2

H0_s = tf([1],[T0 1],'iodelay',Tm)
H0_z = c2d(H0_s,Ts,'zoh')
[num2,den2] = tfdata(H0_z,'v')

H0_zz = tf(num2,den2,Ts,'Variable','z^-1','IoDelay',5)
H0_zz_inv = tf(num2, den2, Ts, 'Variable', 'z^-1')

Hdc1_z = (H0_zz_inv/(1-H0_zz_inv))*(1/Hf_zz_inv)
[num_final, den_final] = tfdata(Hdc1_z, 'v')

%%
%get the poles
zpk(Hdc1_z)

z=tf('z',-1)
Hdc1_z_cor = (7.8154*(1-0.9785*z^-1)*(1-0.9649*z^-1)*(1-0.9048*z^-1))/((1+0.9602)*(1-0.9649*z^-1)*(1-z^-1))
[num_final_cor, den_final_cor] = tfdata(Hdc1_z_cor, 'v')
