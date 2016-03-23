
N = 2; 

tau = 0:0.01:1;


[t0, u0]=Main(N);


for i=1:7
N=N*2;
[t1, u1]=Main(N);

err=0;
for j=1:101
err=err+(interp1(t0, u0, tau(j))-interp1(t1, u1, tau(j)))^2;
end
err=sqrt(err);


%show
N
err
plot(t0, u0);
hold all


t0=t1;
u0=u1;
end
    




  
