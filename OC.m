classdef OC
    
    
    properties
        %interval [0, T]
        T = 0.4;%1/2;
        %n = 256;
        h = T/n;
        mesh = 0:h:T;

        %% input data
        B = 1;
        %y0 = 1;
        x0 = xd(0);
        a = 1;
        alpha = 1;
        beta = 1;%    
        nu = 0.1;
        %target = 1;
        target = xd(T);
        %for the line search method
        sigma = 0.0001;
        eps = 0.000001;
    end
    
    methods
       function res = f(obj, t, x)
           res = obj.a*(1+t)*x + obj.B*obj.u;
       end
       
       function df = df(obj, t, x)
           df = obj.a*(1+t);
       end
       
       function solx = ForwardEquation(obj, u)
           solx = zeros(n+1, 1);
           solx(1) = obj.x0;
           
           %%Runge-Kutta Scheme(Euler)
           % for k=1:n
           %     x(k+1)=x(k)+ h*f(x(k), u(k), t(k), a, B);
           % end
           
           %Runge-Kutta Scheme(implicit midpoint)
           for k=1:n
               solx(k+1) = (1 - obj.h*obj.a*0.5*(1 + obj.mesh(k) + obj.h*0.5))^(-1) * ((1 + obj.h*obj.a*0.5*(1 + obj.mesh(k) + obj.h*0.5))*solx(k) + obj.B*obj.h*0.5*(u(k) + u(k+1)));
           end

       end
       function solp = AdjointEquation(obj, )
           solp = zeros(n+1, 1);
           solp(1) = 
           % for i=n+1:-1:2;
           %     %reversed Runge-Kutta Scheme(Euler)
           %     %p(i-1) =  p(i) + h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(y(i) - yd(t(i)))) ;
           %     %or?????????????????????????????????????????????????????????????????????????????????????????
           %     p(i-1) = p(i) - h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(y(i) - yd(t(i)))) ;
           %     %or?????????????????????????????????????????????????????????????????????????????????????????
           %     %p(i-1) = p(i) + h*(-dfdy(y(i), u(i), t(i), a, B)*p(i) + beta*(y(i) - yd(t(i)))) ;
           % end
           %
           % for i=n+1:-1:2;
           %     %reversed Runge-Kutta Scheme(Euler)
           %     %p(i-1) =  p(i) + h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(y(i) - yd(t(i)))) ;
           %     %or?????????????????????????????????????????????????????????????????????????????????????????
           %     p(i-1) = p(i) - h*(dfdy(y(i), u(i), t(i), a, B)*p(i) - beta*(x(i) - xd(t(i)))) ;
           %     %or?????????????????????????????????????????????????????????????????????????????????????????
           %     %p(i-1) = p(i) + h*(-dfdy(y(i), u(i), t(i), a, B)*p(i) + beta*(y(i) - yd(t(i)))) ;
           % end
           
           %Runge-Kutta Scheme(implicit midpoint)
           for k=n+1:-1:2;
               p(k-1) = (1 + h*0.5*a*(1 + t(k) + h*0.5))^(-1) * ((1 - h*0.5*a*(1 + t(k) + h*0.5))*p(k) + h*beta*(0.5*(x(k) + x(k-1)) - xd(t(k) + 0.5*h)));
           end
           
           
       end
       

 
        
    end
    
end

