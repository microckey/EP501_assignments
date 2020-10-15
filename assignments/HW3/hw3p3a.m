% HW 3 Problem 3(a)
% Find all the roots of the system

clear
clc
close all

%% Define the function & plot it
fm = @(x,y) x^2 + y^2 - (2*x + y);
gm = @(x,y) x^2/4 + y^2 - 1;
gradfm = @grad_p3a_f;
gradgm = @grad_p3a_g;

x = linspace(-20,1,20);
y = linspace(-20,1,20);
[X,Y] = meshgrid(x,y);
F = gradfm(X,Y);
G = gradgm(X,Y);

figure;
surf(X,Y,F);
hold on;
surf(X,Y,G);

%% Find Root #1
i = 1;
x0 = -2i;
y0 = 3i;

% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),it2D(i,1),success2D(i,1)] = newton2D_exact(fm,gradfm,gm,gradgm,x0,y0,100,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),0,'bd','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #2
i = i + 1;
x0 = -0.5;
y0 = 0.7;

% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),it2D(i,1),success2D(i,1)] = newton2D_exact(fm,gradfm,gm,gradgm,x0,y0,100,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),0,'ro','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #3
i = i + 1;
x0 = 3 + 6i;
y0 = 5 - 7i;

% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),it2D(i,1),success2D(i,1)] = newton2D_exact(fm,gradfm,gm,gradgm,x0,y0,100,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),0,'go','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #4
i = i + 1;
x0 = 2;
y0 = 0.000003;

% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),it2D(i,1),success2D(i,1)] = newton2D_exact(fm,gradfm,gm,gradgm,x0,y0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),0,'md','MarkerSize',32,'LineWidth',8);