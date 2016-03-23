function J = objective(y, u, t, target, alpha, beta, nu, n, h)
                      

d1=0;
d2=0;
for i=2:n+1% or  1:n+1 ???????????????????????
    d1 = d1 + (y(i) - yd(t(i)))^2;
    d2 = d2 + u(i)^2;
end

J = 0.5*beta*h*d1 + 0.5*alpha*(y(n+1) - target)^2 + 0.5*nu*h*d2;

end

