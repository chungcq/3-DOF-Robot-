  function x1=forward(q)
% Dong hoc thuan tinh vi tri va huong khau cuoi phu thuoc bien khop
% x1 = rE = [xE, yE, phi]^T;   
global  l2 l3
% q=[ 4.6027;  -4.9637;   -564.0256];
q1=q(1);     q2=q(2);     q3=q(3); 
xe= l3*cos(q1 + q3) + cos(q1)*(l2/2 + q2);
ye= l3*sin(q1 + q3) + sin(q1)*(l2/2 + q2);
ze= atan2(sin(q1 + q3), cos(q1 + q3));
x1=[xe;ye;ze];r


































