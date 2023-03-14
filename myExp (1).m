function y = myExp(x)
neg=false; % initiate variable neg meaning negative (will use this for negative x inputs)
raise=false; % intiate variable raise (we will use this for large x)
if abs(x)>709 % max input for e^x (approximately)
    y="failed, overflow";
    return
end
if x<0
    x=abs(x); % calculate the positive value, we will fix this later on
    neg=true; % we will use this to identify when to take reciprocal 
end
if x>90 % x over 95 returns inf in taylor series, chose 90 just for peace of mind
    x=x/10; % this will prevent overflow, works for all possible inputs (|x|<709)
    raise=true; % we will use this to identify when to raise our answer ^10 (property of exponential)
end
% taylor series calculation below 
y = 1; % initate taylor series function value (1st iteration is = 1)
it = 1; % initiate iterations (already entered first iteration with y=1, so start it at 1 and increase from there)
err = 1; % intiate error, chose 1 so the while statement holds 
while err>5*10^(-12) % stopping criteria for the loop
    previousy=y;
    y = y + (x.^it)/factorial(it); % taylor series formula
    if y~=0 % only calculate relative error if y not zero as to not divide by 0 causing error
        err=abs((y-previousy)/y); end
    it=it+1; % increase iterations
end
if neg==true & raise==true % if it was a large negative input for x (x < -90)...
    y=(y^(-1))^10; % we need to take reciprocal and raise to the power of 10 since earlier we took abs(x) and used x=x/10
elseif raise==true % if it was large input, raise to the power of 10 
    y=y^10;
elseif neg==true % if it was a negative input, take the reciprocal 
    y=y^(-1); 
end % if the above 3 conditions are not met, the function simply returns the output of the taylor series, which is accurate because no error do to large/negative input