clc
close all
clear all

% ??nh ngh?a các thông s? c?a robot
%global l2 l3 a1
l1=240; l2=210; l3=164;
% Load d? li?u v? góc nghiêng c?a các kh?p
load into.mat

tq = ans';
t  = tq(:, 1);
q1 = tq(:, 2);
q2 = tq(:, 3);
q3 = tq(:, 4);

% Tính toán v? trí c?a các kh?p trong không gian Cartesian
for i = 1:1:length(t)
    O0x = 0;
    O0y = 0;
    O0z = 0;

    O1x(i) = 0;
    O1y(i) = 0;
    O1z(i) = 0;

    O2x(i) = (q2(i)+l2/2)*cos(q1(i));
    O2y(i) = (q2(i)+l2/2)*sin(q1(i));
    O2z(i) = 0;

    O3x(i) =  l3*cos(q1(i) + q3(i)) + cos(q1(i))*(l2/2 + q2(i));
    O3y(i) = l3*sin(q1(i) + q3(i)) + sin(q1(i))*(l2/2 + q2(i));
    O3z(i) = 0;

    xA=[0, O1x(i), O2x(i), O3x(i)];
    yA=[0, O1y(i), O2y(i), O3y(i)];
    zA=[0, O1z(i), O2z(i), O3z(i)];
    figure(1)
    xlabel ('x [mm]');
    ylabel ('y [mm]');
    zlabel ('z [mm]');
    plot3(xA, yA, zA, 'k-'), grid on, hold on
    %axis equal
    scatter3(O1x(i),O1y(i),O1z(i), 'gr.'), grid on
    scatter3(O2x(i),O2y(i),O2z(i), 'r.'), grid on
    scatter3(O3x(i),O3y(i),O3z(i), 'm.'), grid on
    
     end
