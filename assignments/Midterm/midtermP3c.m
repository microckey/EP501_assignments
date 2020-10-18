% Midterm Problem 3 (c)
% Find a root of the polynomial
% Use Newton's approx. method

clear
clc
close all

%% Coefficients of the poly
o = 5; % order of the poly
A(:,1) = [1;-15;85;-225;274;-120]; % Coefficients

%% plot
figure
grid on
j = 1;
x = 0:0.01:6;
yline(0,'LineWidth',3)
hold on
plot(x,A(1,j)*x.^(o+1-j) + A(2,j)*x.^(o-j) + A(3,j)*x.^(o-1-j) + A(4,j)*x.^(o-2-j) + A(5,j)*x.^(o-3-j) + A(6,j)*x.^(o-4-j),'r','LineWidth',3);
xlabel('x');
ylabel('f(x)');

%% Find the 1st root (domain = [-inf,inf))
F = @(x) A(1,j)*x^(o+1-j) + A(2,j)*x^(o-j) + A(3,j)*x^(o-1-j) + A(4,j)*x^(o-2-j) + A(5,j)*x^(o-3-j)+ A(6,j)*x^(o-4-j);
maxit = 10000;
tol = 1e-6;
x0 = 0.5;   % Initial guess for the root from the graph

[root,it,success] = newton_approx(F,x0,maxit,tol);

table(root,it,success)