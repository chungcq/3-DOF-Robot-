    function M=matrixM(q)
global m1 m2 m3 l1 l2 l3 a1  I1x I1y I1z I2x I2y I2z I2yz I3x I3y I3z
q1=q(1);
q2=q(2);
q3=q(3);
M =[ I1y + I2z + I3z + a1^2*m1 + (l2^2*m3)/4 + (l3^2*m3)/4 + m2*q2^2 + m3*q2^2 + l2*m3*q2 + (l2*l3*m3*cos(q3))/2 + l3*m3*q2*cos(q3), -(l3*m3*sin(q3))/2, I3z + (l3^2*m3)/4 + (l2*l3*m3*cos(q3))/4 + (l3*m3*q2*cos(q3))/2;
                                                                                                            -(l3*m3*sin(q3))/2,            m2 + m3,                                              -(l3*m3*sin(q3))/2;
                                                                I3z + (l3^2*m3)/4 + (l2*l3*m3*cos(q3))/4 + (l3*m3*q2*cos(q3))/2, -(l3*m3*sin(q3))/2,                                               (m3*l3^2)/4 + I3z;];
 