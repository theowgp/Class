function errL2n = errL2n(y, t, n, h)

d=0;
for i=1:n+1
    d=d+(yd(t(i)) - y(i))^2;
end

errL2n=sqrt(h*d);

end

