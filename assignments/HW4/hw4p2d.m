% HW 4 Pb 2d

clear, clc, close all

load('test_interp.mat')

% Plot the Data
figure, surf(xg,yg,f2D);

% Interpolation
[xi,yi,finterpmanual] = BiLinIntp(xgi,ygi,xg,yg,f2D);

% Plot the Interpolated Function
figure, surf(xi,yi,finterpmanual);

% Plot the MATLAB Interpolation Result
[X,Y] = meshgrid(xg,yg);
[Xq,Yq] = meshgrid(xgi,ygi);
f2Dq = interp2(X,Y,f2D,Xq,Yq);
figure, surf(xgi,ygi,f2Dq);
