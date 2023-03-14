function p = secant(f, x0, x1, n)
if f(x0)*f(x1)>0
    disp('invalid interval, restart')
    return
else
    for i=1:n
        x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
        x0=x1;
        x1=x2;
        root=x2;
    end
end
p=root;
end
