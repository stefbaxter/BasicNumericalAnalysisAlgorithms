function freeSplinePlotter(X,Y)
xx=linspace(X(1),X(length(X)), 1000);
pp=csape(X,Y,'variational');
yy3=ppval(pp,xx); % generate y values
subplot(3,1,1), plot(X,Y,'o',xx,yy3), hold on, grid on, title("free cubic spline with data points")

pp.coefs; % gives matrix of coefficients that define free cubic spline
pp.breaks; % returns x values that define breaks in spline

% find and plot derivatives of free cubic spline
Dpp=fnder(pp,1); % derivative
dyy=ppval(Dpp,xx); % y vals for derivative
subplot(3,1,2), plot(xx,dyy), title('first derivative')

% second derivative
DDpp=fnder(pp,2); % 2nd derivative
ddyy=ppval(DDpp,xx); % y values at second derivative
subplot(3,1,3), plot(xx,ddyy), title('second derivative')
end