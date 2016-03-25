function p = AdjointEquation(p, x, u, t, n, h, a, B, beta)


% for i=n+1:-1:2;
%     %reversed Runge-Kutta Scheme(Euler)
%     %p(i-1) =  p(i) + h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(y(i) - yd(t(i)))) ;           
%     %or?????????????????????????????????????????????????????????????????????????????????????????
%     p(i-1) = p(i) - h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(y(i) - yd(t(i)))) ;           
%     %or?????????????????????????????????????????????????????????????????????????????????????????
%     %p(i-1) = p(i) + h*(-dfdy(y(i), u(i), t(i), a, B)*p(i) + beta*(y(i) - yd(t(i)))) ;           
% end
% 
% for i=n+1:-1:2;
%     %reversed Runge-Kutta Scheme(Euler)
%     %p(i-1) =  p(i) + h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(y(i) - yd(t(i)))) ;           
%     %or?????????????????????????????????????????????????????????????????????????????????????????
%     p(i-1) = p(i) - h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(x(i) - xd(t(i)))) ;           
%     %or?????????????????????????????????????????????????????????????????????????????????????????
%     %p(i-1) = p(i) + h*(-dfdy(y(i), u(i), t(i), a, B)*p(i) + beta*(y(i) - yd(t(i)))) ;           
% end

%Runge-Kutta Scheme(implicit midpoint)
for k=n+1:-1:2;
    p(k-1) = (1 + h*0.5*a*(1 + t(k) + h*0.5))^(-1) * ((1 - h*0.5*a*(1 + t(k) + h*0.5))*p(k) + h*beta*(0.5*(x(k) + x(k-1)) - xd(t(k) + 0.5*h)));
end


end
