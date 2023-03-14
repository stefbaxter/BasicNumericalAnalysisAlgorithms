function y = romberg(f,a,b,e)
maxit=50;
n = 1;
I(1,1) = trapezoid(f,a,b,n);
iter = 0;
while iter<maxit
 iter = iter+1;
 n = 2^iter;
 I(iter+1,1) = trapezoid(f,a,b,n);
 for k = 2:iter+1
 j = 2+iter-k;
 I(j,k) = (4^(k-1)*I(j + 1,k - 1) - I(j,k - 1))/(4^(k - 1)-1)
 % to see the table, remove semi-colon from line above 
 end
 ea = abs((I(1,iter+1)-I(2,iter))/I(1,iter+1))*100;
 if ea<=e, break; end
end
y = I(1,iter+1); 
end

