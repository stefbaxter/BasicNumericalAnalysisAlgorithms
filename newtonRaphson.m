function p = newtonRaphson(f,df,x0,n)
if df(x0)~=0
    for i=1:n
        x1=x0 - f(x0)/df(x0);
        x0=x1;
    end
else
    disp('NR method failed, check if f is differentiable')
end
p=x1;
end
