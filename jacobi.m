% lab 7
% A is a matrix
% enter B as a row vector, function will transpose
function X=jacobi(A,B,tol)
n=size(A,1);
D=diag(diag(A));
B=B';
U=triu(A)-D;
L=tril(A)-D;
T=-inv(D)*(U+L);
rho=abs(eigs(T,1));
if rho < 1
        sol_0=zeros(n,1); % initiate solution guess
        res=B-A*sol_0;
        Z=D\res;
        err=1;
        while err>tol
            sol1=sol_0+Z;
            res=B-A*sol1;
            Z=D\res;
            err=norm(sol1-sol_0)/norm(sol1);
            sol_0=sol1;
        end
else
    sol_0="spec rad > 1";
end
X=sol_0;
end

% yes it converges, can check that rho < 1
% norm(sol_0 - standard matlab A\B soln)/norm(sol_0) = 1.7988x10^-4 hence
% our approximation is close