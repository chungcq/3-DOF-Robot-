syms q1 q2 q3 l1 l2 l3 m1 m2 m3 a1 g
syms q1_dot q2_dot q3_dot
syms r1 r2 r3 % ban kinh khau 1 khau 2 khau 3
syms s1 % do sau lo khoet tren khau 1
syms u1 u2 u3 % momen dau vao 
syms I1x I1y I1z
syms I2x I2y I2z I2yz
syms I3x I3y I3z
q=[q1; q2; q3];
q_dot = [q1_dot; q2_dot; q3_dot];
g0=[0;-g;0]; % gia toc trong he toa do co so
uc11=[0;0;a1;1]; % t?a ?? kh?i tâm khâu 1 trong h? 1 (t?a ?? thu?n nh?t)
uc22=[0;l2/2;0;1];
uc33=[-l3/2;0;0;1];
% IC11=[ 1/12*m1*(3*(r1^2-r2^2)+l1^2-s1^2) 0 0;
%        0 1/12*m1*(3*(r1^2-r2^2)+l1^2-s1^2) 0;
%        0 0 1/2*m1*(r1^2-r2^2)];
% IC22=diag([1/12*m2*(3*(r2^2)+l2^2), 1/2*m2*r2^2,1/12*m2*(3*(r2^2)+l2^2)]);
% IC33=diag([1/2*m3*r3^2, 1/12*m2*(3*(r3^2)+l3^2),1/12*m2*(3*(r3^2)+l3^2)]);
IC11=diag([I1x,I1y,I1z]);
IC22=[ I2x 0 0; 0 I2y I2yz; 0 I2yz I2z];
IC33=diag([I3x,I3y,I3z]);
T01=[ -sin(q1), 0,  cos(q1), 0;
       cos(q1), 0,  sin(q1), 0;
         0    , 1,  0      , 0;
         0    , 0,  0      , 1];
T02 = [-sin(q1), -cos(q1), 0, cos(q1)*(l2/2 + q2);
        cos(q1), -sin(q1), 0, sin(q1)*(l2/2 + q2);
        0, 0, 1, 0;
        0, 0, 0, 1];
T03=[ cos(q1 + q3), -sin(q1 + q3), 0, l3*cos(q1 + q3) + cos(q1)*(l2/2 + q2);
      sin(q1 + q3),  cos(q1 + q3), 0, l3*sin(q1 + q3) + sin(q1)*(l2/2 + q2);
      0, 0, 1, 0;
      0, 0, 0, 1 ];
R01 = [-sin(q1), 0, cos(q1); % MA TRAN QUAY
        cos(q1), 0, sin(q1);
         0       , 1,  0  ];
R02=[-sin(q1), -cos(q1), 0;
      cos(q1), -sin(q1), 0;
        0    ,  0      , 1];
R03=[ cos(q1 + q3), -sin(q1 + q3), 0;
      sin(q1 + q3),  cos(q1 + q3), 0;
      0           ,  0           , 1];
rc10s=T01*uc11; % toa do khoi tam khau 1 trong he co so( toa do thuan) 4x1
rc20s=T02*uc22;
rc30s=T03*uc33;
rc10=[rc10s(1);rc10s(2);rc10s(3)]; % toa do khoi tam c1 trong he 0 (3x1)
rc20=[rc20s(1);rc20s(2);rc20s(3)];
rc30=[rc30s(1);rc30s(2);rc30s(3)];
JT1= jacobian(rc10, [q1,q2,q3]);  % MA TRAN JACOBI TINH TIEN
JT2= simplify(jacobian(rc20, [q1,q2,q3]));
JT3= simplify(jacobian(rc30, [q1,q2,q3]));
w10=[0;0;q1_dot]; %van toc goc khau 1 trong he 0
w20=[0;0;q1_dot];
w30=[0;0;q1_dot+q3_dot];
JR1=jacobian(w10, [q1_dot,q2_dot,q3_dot]); % ma tran jacobi quay cua khau 1
JR2=jacobian(w20, [q1_dot,q2_dot,q3_dot]);
JR3=jacobian(w30, [q1_dot,q2_dot,q3_dot]);   
M1=m1*transpose(JT1)*JT1+transpose(JR1)*R01*IC11*transpose(R01)*JR1+ m2*transpose(JT2)*JT2+transpose(JR2)*R02*IC22*transpose(R02)*JR2+m3*transpose(JT3)*JT3+transpose(JR3)*R03*IC33*transpose(R03)*JR3;
M=simplify(M1) % ma tran khoi luong m thu gon
G=m1*transpose(JT1)*g0+m2*transpose(JT2)*g0+m3*transpose(JT3)*g0;

u=[u1,u2,u2]';
%%========================tinh toan ma tran C=============================%
Cijk = sym(zeros(3, 3, 3)); % tinh cac phan tu cijk
for i = 1:3
    for j = 1:3
        for k = 1:3
            Cijk(i, j, k) = 0.5 * (diff(M(i, j), q(k)) + diff(M(i, k), q(j)) - diff(M(j, k), q(i)));
        end
    end
end
C = sym(zeros(3, 3));
for i = 1:3
    for j = 1:3
        for k = 1:3
            C(i, j) = C(i, j) + Cijk(i, j, k) * q_dot(k);
        end
    end
end
C;
M*u+C*q_dot+g;
