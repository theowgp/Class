function y=myeuler(y, u, t, n, h, a, B)

%if i>n 
%    %return    
%else
%    %Runge-Kutta Scheme(Euler)
%    y(i+1)=y(i)+ h*f(y(i), u(i), t(i), a, B);
%    y=myeuler(y, u, t, i+1, n, h, a, B);
%end

for i=1:n
    %Runge-Kutta Scheme(Euler)
    y(i+1)=y(i)+ h*f(y(i), u(i), t(i), a, B);
end

end

