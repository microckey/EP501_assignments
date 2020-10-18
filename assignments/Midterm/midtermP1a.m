% Thomas algorithm
% Midterm Problem 1(a)

clear
clc
close all

load('iterative_testproblem.mat')

[xTA,iterations] = tridiag(Ait,bit);

disp('Solution with Thomas algorithm:  ')
disp(xTA);

xMAT = Ait\bit;
disp('Matlab built-in solution:  ')
disp(xMAT);

ERR = xMAT - xTA;
disp('Error: ')
disp(ERR)

disp('Number of multiplications required for Thomas algorithm:  ')
disp(iterations);

table(xTA, xMAT, ERR)