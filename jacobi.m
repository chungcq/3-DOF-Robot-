function j=jacobi(q)
global l2 l3
%q=[1;2;3];
q1=q(1);
q2=q(2);
q3=q(3);
   j =[                                                                                                                                                                                         - l3*sin(q1 + q3) - (l2*sin(q1))/2 - q2*sin(q1), cos(q1),                                                                                                                                                                                                                        -l3*sin(q1 + q3);
                                                                                                                                                                                           l3*cos(q1 + q3) + (l2*cos(q1))/2 + q2*cos(q1), sin(q1),                                                                                                                                                                                                                         l3*cos(q1 + q3);
 (((real(sin(q1 + q3)) + imag(cos(q1 + q3)))^2/(real(cos(q1 + q3)) - imag(sin(q1 + q3)))^2 + 1)*(real(cos(q1 + q3)) - imag(sin(q1 + q3)))^2)/((real(cos(q1 + q3)) - imag(sin(q1 + q3)))^2 + (real(sin(q1 + q3)) + imag(cos(q1 + q3)))^2),       0, (((real(sin(q1 + q3)) + imag(cos(q1 + q3)))^2/(real(cos(q1 + q3)) - imag(sin(q1 + q3)))^2 + 1)*(real(cos(q1 + q3)) - imag(sin(q1 + q3)))^2)/((real(cos(q1 + q3)) - imag(sin(q1 + q3)))^2 + (real(sin(q1 + q3)) + imag(cos(q1 + q3)))^2);];
 
