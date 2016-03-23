function dJ = dJ( p, y, u,  nu, B)

dJ = nu*u - B*p';

end

