clc
clear all
% global l1 l2 l3 % chieu dai cac khau
% l1= 14; l2= 22; l3= 5.8;
global T rA rB
T=10;
rA=[ 250.34;200.22;pi/4];
rB=[-250.214;220.4565;pi/3];
%cac thong so test
global g
g=9.81;
global Kp Kd
a=600; b=200;
Kp=diag([a,a,a]);
Kd=diag([b,b,b]);
global d1 d2 d3 % he so can cac khop
d1=1; d2=1; d3=1;
global a1 % toa doi khoi tam c1
a1=89.56;
global m1 m2 m3 l1 l2 l3 I1x I1y I1z I2x I2y I2z I2yz I3x I3y I3z 
m1=265.16; m2=192.78; m3= 103.52; % gam
l1=240; l2=210; l3=164; % mm
I1x=3517794.27	; I1y=91368.35; I1z=3515253.70; % g*mm^2
I2x= 2489211.97; I2y=2485201.77; I2z=34593.91; I2yz=1753.44;

I3x=36681.40; I3y=511596.25; I3z=488039.00;
