function x = ForwardEquation(x, u, t, n, h, a, B)

%%Runge-Kutta Scheme(Euler)
% for k=1:n
%     x(k+1)=x(k)+ h*f(x(k), u(k), t(k), a, B);
% end

%Runge-Kutta Scheme(implicit midpoint)
for k=1:n
    x(k+1) = (1 - h*a*0.5*(1 + t(k) + h*0.5))^(-1) * ((1 + h*a*0.5*(1 + t(k) + h*0.5))*x(k) + B*h*0.5*(u(k) + u(k+1)));
end

end

