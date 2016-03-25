function errL2n = errL2n(x, t, n, h)

d=0;
for i=1:n+1
    d=d+(xd(t(i)) - x(i))^2;
end

errL2n=sqrt(h*d);

end

