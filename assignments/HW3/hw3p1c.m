% HW 3 Problem 1(c)
% Find the first 6 roots of Bessel of 0th order

clear
clc
close all

%% Plot the Bessel function of 0th order
t=linspace(-3,3,100);          %indep variable for gamma and erf
rho=linspace(0,20,200);        %radial independent variable
costh=linspace(-1,1,100);      %cos(theta) variable

figure
grid on
yline(0,'LineWidth',3)
hold on
plot(rho,besselj(0,rho),'r','LineWidth',3);       % Bessel function
xlabel('\rho');
ylabel('J_0(\rho)');

%% Find the 1st root (domain = [0,inf))
F = @(x) besselj(0,x);
maxit = 1000;
tol = 1e-6;
root = [];
it = [];
success = [];

for k = 1 : 6
    x0 = 2 + (k-1)*3;   % Initial guess for the root from the graph
    [root(k,1),it(k,1),success(k,1)] = newton_approx(F,x0,maxit,tol);
end

table(root,it,success)