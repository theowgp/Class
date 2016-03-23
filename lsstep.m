function u = lsstep(dJ, y, uold, t, target, alpha, beta, nu, n, h, a, B, sigma)

s = 1;

Jold = objective(y, uold, t, target, alpha, beta, nu, n, h);

utemp = uold - s*dJ;
Jtemp = objective(y, utemp, t, target, alpha, beta, nu, n, h);


k=0;%to prevent looping
while( (Jtemp > (Jold - s*sigma*norm(dJ)^2)) && k<25 )
    s = s*0.5;
    %s = s/2;
    
    utemp = uold - s*dJ;
    
    ytemp = myeuler(y, utemp, t, n, h, a, B);
    Jtemp = objective(ytemp, utemp, t, target, alpha, beta, nu, n, h);
    
    k=k+1;
end
armjoK=k;
%s=1;
u = uold - s*dJ;

end
