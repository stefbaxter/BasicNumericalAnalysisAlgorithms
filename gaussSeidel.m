% lab 7
function X=gaussSeidel(A,B,tol)
if iscolumn(B)==false
    B=B';
end
n=size(A,1);
D=diag(diag(A));
U=triu(A)-D;
L=tril(A)-D;
T=-inv(D+L)*U;
rho=abs(eigs(T,1));
norm(T,1)
if rho < 1
        sol_0=zeros(n,1); % initiate solution guess
        res=B-A*sol_0;
        Z=(D+L)\res;
        err=1;
        iters=0;
        while err>tol
            sol1=sol_0+Z;
            res=B-A*sol1;
            Z=(D+L)\res;
            err=norm(sol1-sol_0,2);
            sol_0=sol1;
            iters=iters+1;
        end
else
    sol_0="spec rad > 1";
end
X=sol_0;
end
