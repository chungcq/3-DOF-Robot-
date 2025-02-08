function out=vedothi(in)
%in=[1,2,3];
x=in(1);
y=in(2);

plot(x, y, 'ro', 'MarkerSize', 3);
xlabel('X');
ylabel('Y');
hold on;
out=[x;y];
end