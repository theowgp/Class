function [x, u] = minimize(p, x , x0, u, t, target, alpha, beta, nu, n, h, a, B, sigma, eps, limitLS, limitA)
                     
    %% (initial)
    x(1) = x0;
    x = ForwardEquation(x, u, t, n, h, a, B);
    
    
    
    p(n+1) = -alpha*(x(n+1) - target);
    p = AdjointEquation(p, x, u, t, n, h, a, B, beta);
    
    
    dj=dJ(p, x, u,  nu, B);
    

kLS = 0;
kA = 0;
while( mynorm(dj, h)>eps && kLS<limitLS && kA<limitA)
    [kA, u] = DetermineStep(dj, x, u, t, target, alpha, beta, nu, n, h, a, B, sigma, limitA);
        
    x  = ForwardEquation(x, u, t, n, h, a, B);
    
    p(n+1) = -alpha*(x(n+1) - target);
    p  = AdjointEquation(p, x, u, t, n, h, a, B, beta);
   
    dj = dJ(p, x, u,  nu, B);
    
    kLS  = kLS+1; 
    %% print norm of the gradient at each step of the line search method
    gradJk = mynorm(dj, h);
    %% print value of the objective function
    J(x, u, t, target, alpha, beta, nu, n, h);
    %% print iteration
    kLS;
    kA;
end


%% print the number of iterations and gradient of J at each iteration
gradJk = mynorm(dj, h);


end

