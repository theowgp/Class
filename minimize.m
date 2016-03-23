function [y, u] = minimize(p, y , y0, u, t, target, alpha, beta, nu, n, h, a, B, sigma, eps, limitN, limitA)
                     
    %%
    %run Euler methods for y and p (initial)
    %%direct for y
    %euler iterations
    %initial value y0
    y(1) = y0;
    y = myeuler(y, u, t, n, h, a, B);
    %%
    
    %%
    %reversed for p(initial)
    %euler iterations
    %initial value pn+1
    p(n+1) = -alpha*(y(n+1) - target);
    p = myeulerback(p, y, u, t, n, h, a, B, beta);
    %%
                   

    %%
    %evaluste the gradient of J (initial)
    dj=dJ(p, y, u,  nu, B);
    %%

k=0;%to prevent looping
kA=0;
while( mynorm(dj, h)>eps && k<limitN && kA<limitA)
    [kA, u] =lsstep(dj, y, u, t, target, alpha, beta, nu, n, h, a, B, sigma, limitA);
    
    
    %run Euler methods for y and p
    %%
    %direct for y
    %euler iterations
    y = myeuler(y, u, t, n, h, a, B);
    %%
    
    %%
    %reversed for p
    %euler iterations
    p = myeulerback(p, y, u, t, n, h, a, B, beta);
    %%
    
    
    %%
    %evaluste the gradient of J
    dj=dJ(p, y, u,  nu, B);
    %%
    
    %%
    %number of iterstiond
    k=k+1;    
    %%
    
    %%
    %print norm of the gradient at each step of the line search method
    gradJk = mynorm(dj, h);
    %%
    
    %%
    %print value of the objective function
    objective(y, u, t, target, alpha, beta, nu, n, h);
    
    %%
    k;
end

%%
%print the number of iterations and agradient of J at each iteration
kLS=k;
gradJk=mynorm(dj, h);
%%

end

