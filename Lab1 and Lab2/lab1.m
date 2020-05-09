%% ex1
H = tf(8,[1 0.4 12]);
step(H)
stepinfo(H)
sum = 0;
t = step(H);
for i=40:50
    sum = sum+t(i);
end
ss = sum/10;
sse = 1-ss
%% ex2
Htp = tf(2, [1 2 4]);
HPI = tf([1.2 2], [0.6 0]);

SYS = feedback(HPI*Htp, 1)
step(SYS)
stepinfo(SYS)
