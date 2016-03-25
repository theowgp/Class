function [kA, u] = DetermineStep(dJ, y, uold, t, target, alpha, beta, nu, n, h, a, B, sigma, limitA)

s = 1;

Jold = J(y, uold, t, target, alpha, beta, nu, n, h);

utemp = uold - s*dJ;
Jtemp = J(y, utemp, t, target, alpha, beta, nu, n, h);


k=0;
while( (Jtemp > (Jold - s*sigma*norm(dJ)^2)) && k < limitA )
    s = s*0.5;
        
    utemp = uold - s*dJ;
    
    ytemp = ForwardEquation(y, utemp, t, n, h, a, B);
    Jtemp = J(ytemp, utemp, t, target, alpha, beta, nu, n, h);
    
    k=k+1;
end
kA=k;

if kA < limitA
    u = uold - s*dJ;
else
    u = uold;
end

end
