global l1 l2 l3
syms q1 q2 q3

% T?o m?ng ?? l?u tr? t?a ?? x và y
x_values = [];
y_values = [];

for q1 = 0:0.1:pi
    for q2 = (l1 + (l2 / 2) - 10):0.1:(l1 + l2 / 2)
        for q3 = 0:0.1:2 * pi
            x = l3 * cos(q1 + q3) + cos(q1) * (l2 / 2 + q2);
            y = -l3 * sin(q1 - q3) - sin(q1) * (l2 / 2 + q2);
            plot(x,y,'ro','MarkerSize',3);
            hold on;
            
        end
    end
end

