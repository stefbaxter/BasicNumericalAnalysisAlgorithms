function p = bisection(f,a,b,n)
x0=a;
x1=b;
iters=0;
x2=(x1+x0)/2;
while iters<n
    if f(x0)*f(x2)<0
        x1=x2;
    else 
        x0=x2;
    end
        x2=(x0+x1)/2;
        iters=iters+1;
        root=x2;
end
p=root;
end