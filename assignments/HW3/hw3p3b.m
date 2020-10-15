% HW 3 Problem 3(b)
% Find all the roots of the system

clear
clc
close all

%% Define the function & plot it
fm = @(x,y,z) x^2 + y^2 + z^2 - 6;
gm = @(x,y,z) x^2 - y^2 + 2*z^2 - 2;
hm = @(x,y,z) 2*x^2 + y^2 - z^2 - 3;
gradfm = @grad_p3b_f;
gradgm = @grad_p3b_g;
gradhm = @grad_p3b_h;

%% Find Root #1
i = 1;
x0 = -2;
y0 = 0.3;
z0 = 0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'bd','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #2
i = i + 1;
x0 = -2;
y0 = -0.3;
z0 = 0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'rd','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #3
i = i + 1;
x0 = -2;
y0 = 0.3;
z0 = -0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'md','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #4
i = i + 1;
x0 = 2;
y0 = 0.3;
z0 = -0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'gd','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #5
i = i + 1;
x0 = 2;
y0 = 0.3;
z0 = 0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'wd','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #6
i = i + 1;
x0 = 2;
y0 = -0.3;
z0 = 0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'kd','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #7
i = i + 1;
x0 = 2;
y0 = -0.3;
z0 = -0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'yd','MarkerSize',32,'LineWidth',8);
hold on

%% Find Root #8
i = i + 1;
x0 = -2;
y0 = -0.3;
z0 = -0.5;
% Newton's method for multi-variable nonlinear equations
[xm(i,1),ym(i,1),zm(i,1),it3D(i,1),success3D(i,1)] = newton3D_exact(fm,gradfm,gm,gradgm,hm,gradhm,x0,y0,z0,1000,1e-6,true);
table(xm,ym,zm,it3D,success3D)
% Adding root to the plot
plot3(xm(i,1),ym(i,1),zm(i,1),'cd','MarkerSize',32,'LineWidth',8);