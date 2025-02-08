function test=test1()
syms q1 q2 l2 q3 l3 
a01=[ cos(q1+pi/2), 0, sin(q1+pi/2), 0;
      sin(q1+pi/2), 0, -cos(q1+pi/2), 0;
      0           , 1, 0            , 0;
      0            , 0, 0            , 1;];
 a12=[ 1, 0, 0, 0;
       0, 0, 1, 0;
       0,-1, 0, q2+(l2/2);
       0, 0, 0, 1;       ];
 a23=[ cos((-pi/2)+q3), -sin((-pi/2)+q3), 0, l3*cos((-pi/2)+q3);
       sin((-pi/2)+q3),  cos((-pi/2)+q3), 0, l3*sin((-pi/2)+q3);
       0              ,  0              , 1, 0                 ;
       0              ,  0              , 0, 1                 ;];
 a011=[ -sin(q1), 0,  cos(q1), 0;
         cos(q1), 0, sin(q1), 0;
         0       , 1,  0       , 0;
         0       , 0,  0       , 1;];
 a231=[ sin(q3), cos(q3), 0,  l3*sin(q3);
       -cos(q3), sin(q3), 0, -l3*cos(q3);
       0       , 0      , 1,  0;
       0       , 0      , 0,  1;           ];
   disp(simplify(a01))
   disp(simplify(a01*a12))
   disp(simplify(a01*a12*a23))
xe=[ l3*cos(q1 + q3) + (l2*cos(q1))/2 + q2*cos(q1);
     l3*sin(q1 + q3) + (l2*sin(q1))/2 + q2*sin(q1);
     atan2(sin(q1 + q3), cos(q1 + q3));];
 j=jacobian(xe,[q1,q2,q3]);

   
end