% HW 3 Problem 1(b)
% Find the smallest positive root of Bessel of 0th order

clear
clc
close all

%% Plot the Bessel function of 0th order
t=linspace(-3,3,100);          %indep variable for gamma and erf
rho=linspace(0,10,100);        %radial independent variable
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
x0 = 2;     % Initial guess for the 1st root from the graph
maxit = 10;
tol = 1e-6;

[root,it,success] = newton_approx(F,x0,maxit,tol)