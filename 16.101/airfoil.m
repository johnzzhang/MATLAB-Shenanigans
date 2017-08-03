M = 4;
P = 5;
TT = 10;

c = .5;
t_max = TT/100*c;
% change -1.015 to -1.036 for zero thickness on trailing edge
t = @(x) t_max * (2.969.*(x/c).^0.5 - 1.260.*(x/c) - 3.516.*(x/c).^2 + 2.843.*(x/c).^3 - 1.036.*(x/c).^4);

h=0.0001;
x=0:h:c;

%z_cmax = M/100*c;
%x_cmax = P/10*c;

m = M/100;
p = P/10;

z_c = @(x) ((x/c >= 0 & x/c <= p).*(m/p^2.*x/c.*(2*p-x/c)))+((x/c > p & x/c <= 1) .* (m/(1-p)^2*(1-2*p+2*p.*x/c-(x/c).^2)));

% check for NaN for symmetric airfoils
z_c_s = c*z_c(x);
z_c_s(isnan(z_c_s))=0;

theta_c = atan(diff(z_c_s)/h);

x_u = @(x,theta) x-t(x)*.5.*sin(theta);
z_u = @(x,theta) z_c_s(1:end-1)+t(x)*.5.*cos(theta);

x_l = @(x,theta) x+t(x)*.5.*sin(theta);
z_l = @(x,theta) z_c_s(1:end-1)-t(x)*.5.*cos(theta);

hold on;
daspect([1 1 1])
xlim([0,c]);
plot(x,z_c_s,'r--');
plot(x_u(x(1:end-1),theta_c),z_u(x(1:end-1),theta_c),'b-');
plot(x_l(x(1:end-1),theta_c),z_l(x(1:end-1),theta_c),'b-');
title('NACA 4510');
hold off;
