function q_dot=tinh_q_dot(input)
% x=[5,6,0];
% q=newton_raphson(x);
   
jx=jacobi(input(1:3));

x_dot=input(7:9);

q_dot=jx^-1*x_dot;
 
  