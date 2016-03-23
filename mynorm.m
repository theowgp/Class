function res = mynorm(x, h)

d = 0;
for i = 1:length(x)
    d = d + x(i)^2;
end

res = sqrt(h*d);

end

