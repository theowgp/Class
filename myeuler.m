function y=myeuler(y, u, t, n, h, a, B)

%if i>n 
%    %return    
%else
%    %Runge-Kutta Scheme(Euler)
%    y(i+1)=y(i)+ h*f(y(i), u(i), t(i), a, B);
%    y=myeuler(y, u, t, i+1, n, h, a, B);
%end

% for k=1:n
%     %Runge-Kutta Scheme(Euler)
%     y(k+1)=y(k)+ h*f(y(k), u(k), t(k), a, B);
% end

%Runge-Kutta Scheme(implicit midpoint)
for k=1:n
    y(k+1) = (1 - h*a*0.5*(1 + t(k) + h*0.5))^(-1) * ((1 + h*a*0.5*(1 + t(k) + h*0.5))*y(k) + B*h*0.5*(u(k) + u(k+1)));
end

end

