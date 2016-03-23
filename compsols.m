function   compsols(y, u, t, n, h, a, B, T)

y = myeuler(y, u, t, n, h, a, B);


%plot the solution of optimality system y
plot(t, y);
hold all
%plot the desired trajectory
ydtemp=@(t) yd(t);
fplot(ydtemp,[0, T])


end

