function X=relaxation(A,B,c,tol)
if iscolumn(B)==false
    B=B'; % ensure B is a column vector for accurate calculations
end
n=size(A,1); % define length of solution vector 
D=diag(diag(A)); % define diagonal matrix
U=triu(A)-D; % define upper triangular matrix
L=tril(A)-D; % define lower triangular matrix
T=inv(D+(c*L))*((1-c)*D-(c*U)); % find the matrix T
rho=abs(eigs(T,1)); % calculate the spectral radius of T
if rho < 1 % check if iterative method will work
        sol_0=zeros(n,1); % initiate solution guess
        res=B-A*sol_0; % initiate residual
        Z=((inv(c)*D)+L)\res; % initiate Z
        err=1; % initiate error
        iters=0; % initiate iterations
        while err>tol
            sol1=sol_0+Z; % calculate sol_n+1
            res=B-A*sol1; % calculate res_n+1
            Z=((inv(c)*D)+L)\res; % calculate Z_n+1
            err=norm(sol1-sol_0)/norm(sol1); % calculate error using relative 1 norm
            sol_0=sol1; % update value of sol_0 to repeat the loop with next iteration
            iters=iters+1; % count iterations
        end
else
    sol_0="spectral radius of T > 1, divergent"; % if spectral radius > 1, iterative methods won't work
end
X=sol_0; % output 
end