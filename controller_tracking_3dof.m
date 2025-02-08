function u= controller_tracking_3dof(ins)
 %ins=[1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1]';
global Kp Kd
qd=ins(1:3); vd=ins(4:6); ad=ins(7:9);
q=ins(10:12); qdot=ins(13:15);
M=matrixM(q); C=matrixC(q,qdot); G=matrixG(q);
D=matrixD;
et=qd-q; edot=vd-qdot;
y=ad+Kd*edot+Kp*et; b=(C+D)*qdot+G;
u=M*y+b;