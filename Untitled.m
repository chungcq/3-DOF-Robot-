% ??nh ngh?a các thông s? c?a robot
l2 = 21; % Chi?u dài c?a kh?p th? hai
l3 = 16.4; % Chi?u dài c?a kh?p th? ba

% T?o l??i cho các góc joint q1, q2, q3
q1_range = linspace(0, pi, 20);  % kho?ng t? 0 ??n pi
q2_range = linspace(24.5, 34.5, 20); % kho?ng t? 24.5 ??n 34.5 ??
q3_range = linspace(0, pi, 20);  % kho?ng t? 0 ??n pi

% Kh?i t?o ma tr?n ch?a t?a ?? x, y c?a ?i?m cu?i c?a robot
xe_matrix = zeros(length(q1_range), length(q2_range), length(q3_range));
ye_matrix = zeros(length(q1_range), length(q2_range), length(q3_range));

% Tính toán t?a ?? x, y cho t?ng giá tr? c?a q1, q2, q3
for i = 1:length(q1_range)
    for j = 1:length(q2_range)
        for k = 1:length(q3_range)
            xe_matrix(i, j, k) = l3*cos(q1_range(i) + q3_range(k)) + cos(q1_range(i))*(l2/2 + q2_range(j));
            ye_matrix(i, j, k) = l3*sin(q1_range(i) + q3_range(k)) + sin(q1_range(i))*(l2/2 + q2_range(j));
        end
    end
end

% V? không gian làm vi?c
figure;
for i = 1:length(q1_range)
    for j = 1:length(q2_range)
        for k = 1:length(q3_range)
            plot(xe_matrix(i, j, k), ye_matrix(i, j, k), 'b.');
            hold on;
        end
    end
end

xlabel('X');
ylabel('Y');
title('Không gian làm vi?c c?a robot 3 b?c t? do');
grid on;
