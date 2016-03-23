function [t, u] = Main(n)
clear alpha a B beta nu sigma eps h  p t T target y y0 yex u % and n if to use this file as a script



%interval [0, T]
T = 1;%1/2;
%n = 256;
h = T/n;
t = 0:h:T;

%% input data
B = 1;
%y0 = 1;
y0 = yd(0);
a = 1;
alpha = 1;
beta = 1;%    
nu = 0.0001;
%target = 1;
target = yd(T);
%for the line search method
sigma = 0.0001;
eps = 0.00000001;



y = zeros(n+1,1);
p = zeros(n+1,1);
u = zeros(n+1,1);
%u = u(t);
u = -t.^2;





%run Euler methods for y and p
%direct for y
%initial value y0
%y(1) = y0;
%euler iterations
%y = myeuler(y, u, t, 1, n, h, a, B);

%reversed for p
%initial value y0
%p(n+1) = -alpha*(y(n+1) - target);
%euler iterations
%p = myeulerback(p, y, u, t, n+1, n, h, a, B, beta);

%% do minimization
[y, u] = minimize(p, y, y0, u, t, target, alpha, beta, nu, n, h, a, B, sigma, eps);

%compare soluions
%compsols(y, u, t, n, h, a, B, T);

%compute L2 error between y and yd
%display('L2n error:');
%errL2n(y, t, n, h);

%plot the optimized solution u
% figure
% plot(t,u);


%% plot the solution y
figure
plot(t,y);
hold all
%% plot the decided trajectory y
f = @(t) yd(t);
fplot(f, [0, T]);

%display the error between y and yex
%display('L2n error:');
%errL2nfory(y, t, n, h, y0, a)

%plot p in a new figure
%figure
%plot(t,p);
end