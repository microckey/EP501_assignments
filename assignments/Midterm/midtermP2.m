% Midterm Problem 2
% Find all the roots (real & complex) of a polynomial

clear
clc
close all

%% Define the constants
gamma = 5/3; % adiabatic index
p = 1.38*1e-11; % plasma thermal pressure
rho = 1.67*1e-21; % plasma mass density
B = 1e-9; % magnitude of the local magnetic field
magcst = 4*pi*1e-7; % magnetic constant
theta = pi/4;   % plasma propagation angle
s = sin(theta);
ss = s^2;
c = cos(theta);
cs = c^2;
Cs = sqrt(gamma*p/rho); % sound speed
Css = Cs^2;
Ca = sqrt(B^2/(magcst*rho)); % Alfven speed
Cas = Ca^2;

%% Define the poly
o = 6; % Order of the poly
i = o;
A(:,1) = [1;0;-(Css+Cas*(1+cs));0;Cas*cs*(Cas+2*Css);0;-(Cas*cs)^2*Css]; % Coefficients

%% Newton's Method
maxit = 1000000;
tol = 1e-6;
x0 = 10000;    % Initial guess for root

for j = 1 : o
    if i == 6
        x0 = 10000;
        F = @(x) A(1,j)*x^(o+1-j) + A(2,j)*x^(o-j) + A(3,j)*x^(o-1-j) + A(4,j)*x^(o-2-j) + A(5,j)*x^(o-3-j) + A(6,j)*x^(o-4-j) + A(7,j)*x^(o-5-j);
        Fprime = @(x) (o+1-j)*A(1,j)*x^(o-j) + (o-j)*A(2,j)*x^(o-1-j) + (o-1-j)*A(3,j)*x^(o-2-j) + (o-2-j)*A(4,j)*x^(o-3-j) + (o-3-j)*A(5,j)*x^(o-4-j) + (o-4-j)*A(6,j)*x^(o-5-j);
    elseif i == 5
        x0 = 20000;
        F = @(x) A(1,j)*x^(o+1-j) + A(2,j)*x^(o-j) + A(3,j)*x^(o-1-j) + A(4,j)*x^(o-2-j) + A(5,j)*x^(o-3-j) + A(6,j)*x^(o-4-j);
        Fprime = @(x) (o+1-j)*A(1,j)*x^(o-j) + (o-j)*A(2,j)*x^(o-1-j) + (o-1-j)*A(3,j)*x^(o-2-j) + (o-2-j)*A(4,j)*x^(o-3-j) + (o-3-j)*A(5,j)*x^(o-4-j);
    elseif i == 4
        x0 = -10000;
        F = @(x) A(1,j)*x^(o+1-j) + A(2,j)*x^(o-j) + A(3,j)*x^(o-1-j) + A(4,j)*x^(o-2-j) + A(5,j)*x^(o-3-j);
        Fprime = @(x) (o+1-j)*A(1,j)*x^(o-j) + (o-j)*A(2,j)*x^(o-1-j) + (o-1-j)*A(3,j)*x^(o-2-j) + (o-2-j)*A(4,j)*x^(o-3-j);
    elseif i == 3
        x0 = -20000;
        F = @(x) A(1,j)*x^(o+1-j) + A(2,j)*x^(o-j) + A(3,j)*x^(o-1-j) + A(4,j)*x^(o-2-j);
        Fprime = @(x) (o+1-j)*A(1,j)*x^(o-j) + (o-j)*A(2,j)*x^(o-1-j) + (o-1-j)*A(3,j)*x^(o-2-j);
    elseif i == 2
        F = @(x) A(1,j)*x^(o+1-j) + A(2,j)*x^(o-j) + A(3,j)*x^(o-1-j);
        Fprime = @(x) (o+1-j)*A(1,j)*x^(o-j) + (o-j)*A(2,j)*x^(o-1-j);
    elseif i == 1
        F = @(x) A(1,j)*x^(o+1-j) + A(2,j)*x^(o-j);
        Fprime = @(x) (o+1-j)*A(1,j)*x^(o-j);
    end % if
    
    [root(j,1),it(j,1),success(j,1)] = newton_exact(F,Fprime,x0,maxit,tol);
    
    % Obtain next coefficients
    for k = 1 : o+1-j
        if k == 1
            A(k,j+1) = A(k,j);
        else
            A(k,j+1) = A(k,j) + root(j,1)*A(k-1,j+1);
        end % if
    end % for
    
    i = i - 1;  % Update the order for the next poly
    
end % for

table(root,it,success)

%% Plot the polynomial
figure
grid on
j = 1;
x = -120000:0.1:120000;
yline(0,'LineWidth',3)
hold on
plot(x,A(1,j)*x.^(o+1-j) + A(2,j)*x.^(o-j) + A(3,j)*x.^(o-1-j) + A(4,j)*x.^(o-2-j) + A(5,j)*x.^(o-3-j) + A(6,j)*x.^(o-4-j) + A(7,j)*x.^(o-5-j),'r','LineWidth',3);
xlabel('x');
ylabel('f(x)');
hold off

figure
grid on
x = 15000:0.1:15750;
yline(0,'LineWidth',3)
hold on
plot(x,A(1,j)*x.^(o+1-j) + A(2,j)*x.^(o-j) + A(3,j)*x.^(o-1-j) + A(4,j)*x.^(o-2-j) + A(5,j)*x.^(o-3-j) + A(6,j)*x.^(o-4-j) + A(7,j)*x.^(o-5-j),'r','LineWidth',3);
xlabel('x');
ylabel('f(x)');
hold off