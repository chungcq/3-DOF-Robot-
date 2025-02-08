function rEvE = trajectory_tron(t)
%t=10;
global rA rB T
%% ------------- quy dao tròn -------------------

ra1=[rA(1);rA(2);0];
rb1=[rB(1);rB(2);0];
% tr??ng h?p AB là ???ng kính
AB=norm(rb1-ra1);
C=(ra1+rb1)/2;
R=AB/2;
L=R*pi;
% tr??ng h?p cho tâm C
% C=[0;40;0];
% R = sqrt((ra1(1) - C(1))^2 + (ra1(2) - C(2))^2);
% theta = atan2(ra1(2) - C(2),ra1(1) - C(1)) + atan2(rb1(2) - C(2), rb1(1) - C(1));
% AB = R * abs(theta);
% L=AB;


[s, sdot, sddot] = trajectory_hinhthang(t, L, T);
phi=atan2(rA(2)-C(2),rA(1)-C(1));
R1=[ cos(phi), -sin(phi), 0;
     sin(phi),  cos(phi), 0;
     0       ,  0       , 1];
P=[R*cos(s/R);   % vi tri p trong Cx'y'z'
   R*sin(s/R);
   0];
PDOT=[-sin(s/R);
       cos(s/R);
       0];
rE1= C + R1*P;   %vi tri p trong he co dinh Oxyz
vE1= sdot*R1*PDOT;
%% ------------- huong khâu cuoi -------------------
ra2=[0;0;rA(3)];
rb2=[0;0;rB(3)];
Ls= norm(rB-rA);
u=(rB-rA)/Ls;
[s1, s1dot, s1ddot] = trajectory_hinhthang(t,Ls,T);
rE2 = rA + s1*u; 
vE2 = s1dot*u; 
%% ------------- toa do + huong -------------------
rE=[rE1(1);rE1(2);rE2(3)];
vE=[vE1(1);vE1(2);vE2(3)];
rEvE = [rE;vE];
end