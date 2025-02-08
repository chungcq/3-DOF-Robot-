function [s,sdot,sddot]= trajectory_cycloid(t,L,T)
% tao hàm s theo quy dao cycloid

if (t<=T)
    s= (L/pi)*(pi*t/T-0.5*sin(2*pi*t/T));
    sdot= (L/T)*(1-cos(2*pi*t/T));
    sddot=(2*pi*L/T^2)*sin(2*pi*t/T);
else
    s=L;
    sdot=0;
    sddot=0;
end
end
