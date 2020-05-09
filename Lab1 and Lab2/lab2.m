%% data sets
%data set1
% Before running a section it is healthy to clear all from terminal
%and then run the first section with the data sets
t1 = [0, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 1.8000, 2.0000, 2.2000, 2.4000, 2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000];
y1 = [0, 0.5652, 1.0365, 1.4294, 1.7570, 2.0302, 2.2579, 2.4478, 2.6061, 2.7381, 2.8481, 2.9399, 3.0163, 3.0801, 3.1333, 3.1776, 3.2146, 3.2454, 3.2711, 3.2926, 3.3104, 3.3253, 3.3377, 3.3481, 3.3567, 3.3639];

t2 = [0, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 1.8000, 2.0000, 2.2000, 2.4000, 2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000];
y2 = [0, 0, 0, 0.5262, 1.0291, 1.4232, 1.7320, 1.9740, 2.1636, 2.3121, 2.4285, 2.5198, 2.5912, 2.6472, 2.6911, 2.7255, 2.7525, 2.7736, 2.7901, 2.8031, 2.8132, 2.8212, 2.8274, 2.8323, 2.8361, 2.8391];


t3 = [0, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 1.8000, 2.0000, 2.2000, 2.4000, 2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000];
y3 = [0, 0.3196, 1.0179, 1.8455, 2.6711, 3.4310, 4.0994, 4.6710, 5.1508, 5.5485, 5.8750, 6.1413, 6.3576, 6.5326, 6.6739, 6.7876, 6.8791, 6.9527, 7.0117, 7.0590, 7.0970, 7.1274, 7.1518, 7.1714, 7.1870, 7.1996];


%% exercise 1
%1.a
hold on
plot(t1,y1) 
dy = [];
for i=1:(length(t1)-1)
    dy(i) = (y1(i+1)-y1(i))/(t1(i+1)-t1(i));
end
plot(t1(1:length(t1)-1), dy)
% no inflection point, hence start at 1
k = 1
tang=(t1-t1(k))*dy(k)+y1(k);
yss = 3.364;
intersect_point  = find(tang >= yss, 1, 'first');
plot(t1(k:intersect_point),tang(k:intersect_point));
scatter(t1(k),y1(k));
K1=y1(end);
Ts=1.2;
H1=tf(K1,[Ts 1])
step(H1)
legend('dataset','derivate', 'tangent','tangentIntersection','tangentMethod Step');

%% ex2
hold on
plot(t2,y2) 
dy = [];
for i=1:(length(t2)-1)
    dy(i) = (y2(i+1)-y2(i))/(t2(i+1)-t2(i));
end
plot(t2(1:length(t2)-1), dy)
% inflection point at 4
k = 4
tang=(t2-t2(k))*dy(k)+y2(k);
yss = 2.839;
intersect_point  = find(tang >= yss, 1, 'first');
plot(t2(k:intersect_point),tang(k:intersect_point));
scatter(t2(k),y2(k));
K1=y2(end)-y2(3);
Ts=1.1;
Tm = 0.4; %the time up until de inflection point
H=tf(K1,[Ts 1], 'iodelay', Tm)
step(H)
legend('dataset','derivate', 'tangent','tangentIntersection','tangentMethod Step');

%% ex3
%tangent method
hold on
plot(t3,y3) 
dy = [];
for i=1:(length(t3)-1)
    dy(i) = (y3(i+1)-y3(i))/(t3(i+1)-t3(i));
end
plot(t3(1:length(t3)-1), dy)
% inflection point at 4
k = 4
tang=(t3-t3(k))*dy(k)+y3(k);
yss = y3(end);
intersect_point  = find(tang >= yss, 1, 'first');
plot(t3(k:intersect_point),tang(k:intersect_point));
scatter(t3(k),y3(k));
K1=y3(end)-y3(3);
Ts=1.75;
Tm = 0.153; %the time up until de inflection point
Htan=tf(K1,[Ts 1], 'iodelay', Tm)
step(Htan)
legend('dataset','derivate', 'tangent','tangentIntersection','tangentMethod Step');
%cohen coon method
y_aux_1=0.632*y3(end);
y_aux_2=0.28*y3(end);
x1=find(y3>=y_aux_1,1,'first');
x2=find(y3>=y_aux_2,1,'first');
T1=t3(x1);
T2=t3(x2);
Ts4=1.5*(T1-T2);
Tm=1.5*(T2-(1/3*T1));
Hcohc=tf(K1,[Ts4 1],'iodelay',Tm);
%lsim(H4,ones(1,length(t3)),t3);
figure;
hold on
plot(t3,y3)
step(Htan)
step(Hcohc)
legend('data', 'tangent method', 'cohen coon method')

