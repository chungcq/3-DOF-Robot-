function G=matrixG(q)
global m1 m2 m3 l1 l2 l3 g a1 I1x I1y I1z I2x I2y I2z I3x I3y I3z
q1=q(1);
q2=q(2);
q3=q(3);
G =[ - g*m3*((l3*cos(q1 + q3))/2 + cos(q1)*(l2/2 + q2)) - a1*g*m1*cos(q1) - g*m2*q2*cos(q1);
                                                          - g*m2*sin(q1) - g*m3*sin(q1);
                                                              -(g*l3*m3*cos(q1 + q3))/2; ]