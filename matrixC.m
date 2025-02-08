function C=matrixC(q,qdot)
global m1 m2 m3 l1 l2 l3 a1  I1x I1y I1z I2x I2y I2z I2yz I3x I3y I3z
q1=q(1);  q1_dot=qdot(1);
q2=q(2);  q2_dot=qdot(2);
q3=q(3);  q3_dot=qdot(3);
C =[ q2_dot*((l2*m3)/2 + m2*q2 + m3*q2 + (l3*m3*cos(q3))/2) - q3_dot*((l2*l3*m3*sin(q3))/4 + (l3*m3*q2*sin(q3))/2), q1_dot*((l2*m3)/2 + m2*q2 + m3*q2 + (l3*m3*cos(q3))/2), - q1_dot*((l2*l3*m3*sin(q3))/4 + (l3*m3*q2*sin(q3))/2) - q3_dot*((l2*l3*m3*sin(q3))/4 + (l3*m3*q2*sin(q3))/2);
                           - q1_dot*((l2*m3)/2 + m2*q2 + m3*q2 + (l3*m3*cos(q3))/2) - (l3*m3*q3_dot*cos(q3))/2,                                                      0,                                                         - (l3*m3*q1_dot*cos(q3))/2 - (l3*m3*q3_dot*cos(q3))/2;
                              q1_dot*((l2*l3*m3*sin(q3))/4 + (l3*m3*q2*sin(q3))/2) + (l3*m3*q2_dot*cos(q3))/2,                               (l3*m3*q1_dot*cos(q3))/2,                                                                                                             0;]
 