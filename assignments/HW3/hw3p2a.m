% HW 3 Problem 2(a)
% Find all the real roots of a polynomial

clear
clc
close all

%% Define the polynomial
o = 5; % Order of the poly
a = zeros(o+1);
a(:,1) = [1;-15;85;-225;274;-120]; % Coefficients of the poly

%% Plot the polynomial
x = 0:0.01:6;

figure
grid on
yline(0,'LineWidth',3)
hold on

j = 1;
plot(x,a(1,j)*x.^(o+1-j) + a(2,j)*x.^(o-j) + a(3,j)*x.^(o-1-j) + a(4,j)*x.^(o-2-j) + a(5,j)*x.^(o-3-j)+ a(6,j)*x.^(o-4-j),'r','LineWidth',3);
xlabel('x');
ylabel('f(x)');

%% Root #1
j = 1;
F = @(x) a(1,j)*x^(o+1-j) + a(2,j)*x^(o-j) + a(3,j)*x^(o-1-j) + a(4,j)*x^(o-2-j) + a(5,j)*x^(o-3-j)+ a(6,j)*x^(o-4-j);
Fprime = @(x) (o+1-j)*a(1,j)*x^(o-j) + (o-j)*a(2,j)*x^(o-1-j) + (o-1-j)*a(3,j)*x^(o-2-j) + (o-2-j)*a(4,j)*x^(o-3-j) + (o-3-j)*a(5,j)*x^(o-4-j);

% Newton's Method
maxit = 1000;
tol = 1e-6;
root = [];
it = [];
success = [];
x0 = 0;

[root(j,1),it(j,1),success(j,1)] = newton_exact(F,Fprime,x0,maxit,tol);

% Obtain next coefficients
for k = 1 : o+1-j
    if k == 1
        a(k,j+1) = a(k,j) + root(j,1)*0;
    else
        a(k,j+1) = a(k,j) + root(j,1)*a(k-1,j+1);
    end % if
end % for

%% Root #2
% Define the funtion
j = j + 1;
F = @(x) a(1,j)*x^(o+1-j) + a(2,j)*x^(o-j) + a(3,j)*x^(o-1-j) + a(4,j)*x^(o-2-j) + a(5,j)*x^(o-3-j);
Fprime = @(x) (o+1-j)*a(1,j)*x^(o-j) + (o-j)*a(2,j)*x^(o-1-j) + (o-1-j)*a(3,j)*x^(o-2-j) + (o-2-j)*a(4,j)*x^(o-3-j);
[root(j,1),it(j,1),success(j,1)] = newton_exact(F,Fprime,x0,maxit,tol);
% Obtain next coefficients
for k = 1 : o+1-j
    if k == 1
        a(k,j+1) = a(k,j) + root(j,1)*0;
    else
        a(k,j+1) = a(k,j) + root(j,1)*a(k-1,j+1);
    end % if
end % for

%% Root #3
% Define the funtion
j = j + 1;
F = @(x) a(1,j)*x^(o+1-j) + a(2,j)*x^(o-j) + a(3,j)*x^(o-1-j) + a(4,j)*x^(o-2-j);
Fprime = @(x) (o+1-j)*a(1,j)*x^(o-j) + (o-j)*a(2,j)*x^(o-1-j) + (o-1-j)*a(3,j)*x^(o-2-j);
[root(j,1),it(j,1),success(j,1)] = newton_exact(F,Fprime,x0,maxit,tol);
% Obtain next coefficients
for k = 1 : o+1-j
    if k == 1
        a(k,j+1) = a(k,j) + root(j,1)*0;
    else
        a(k,j+1) = a(k,j) + root(j,1)*a(k-1,j+1);
    end % if
end % for

%% Root #4
% Define the funtion
j = j + 1;
F = @(x) a(1,j)*x^(o+1-j) + a(2,j)*x^(o-j) + a(3,j)*x^(o-1-j);
Fprime = @(x) (o+1-j)*a(1,j)*x^(o-j) + (o-j)*a(2,j)*x^(o-1-j);
[root(j,1),it(j,1),success(j,1)] = newton_exact(F,Fprime,x0,maxit,tol);
% Obtain next coefficients
for k = 1 : o+1-j
    if k == 1
        a(k,j+1) = a(k,j) + root(j,1)*0;
    else
        a(k,j+1) = a(k,j) + root(j,1)*a(k-1,j+1);
    end % if
end % for

%% Root #5
% Define the funtion
j = j + 1;
F = @(x) a(1,j)*x^(o+1-j) + a(2,j)*x^(o-j);
Fprime = @(x) (o+1-j)*a(1,j)*x^(o-j);
[root(j,1),it(j,1),success(j,1)] = newton_exact(F,Fprime,x0,maxit,tol);
% Obtain next coefficients
for k = 1 : o+1-j
    if k == 1
        a(k,j+1) = a(k,j) + root(j,1)*0;
    else
        a(k,j+1) = a(k,j) + root(j,1)*a(k-1,j+1);
    end % if
end % for

table(root,it,success)