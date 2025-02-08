function q0 = newton_raphson(x)
    
 global l2 l3
 q = [0; 0; 0];
 x = [ 150.34;200.22;pi/4];
 x0=x(1);
 y0=x(2);
 z0=x(3);
    % Set tolerance and maximum iterations
    tolerance = 1e-6;
    max_iterations = 1000;
    num_iterations = 0;
    q0 = zeros(size(q));
    while num_iterations < max_iterations
    % Calculate the value of the functions F at the point q
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
       fx =[ l3*cos(q1 + q3) + cos(q1)*(q2 + l2/2)-x0;
             l3*sin(q1 + q3) + sin(q1)*(q2 + l2/2)-y0;
             atan2(sin(q1 + q3), cos(q1 + q3))-z0  ];
    
   
      Jx = jacobi(q); 
      delta_q = Jx^-1*(-fx);
      q = q + delta_q;
      if norm(delta_q) < tolerance
            q0 = q
            break;
      end
      num_iterations = num_iterations + 1;
    end

    % If no solution is found after the maximum iterations
  q0 = q;
%  
%   x1=forward(q0)
%   x-x1
end
