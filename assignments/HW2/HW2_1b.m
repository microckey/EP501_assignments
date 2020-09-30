% HW 2 Problem 1(b)

clear
clc
close all

load('testproblem.mat');

% A = [80 -20 -20; -20 40 -20; -20 -20 130]
% b = [20 20 20]'

[L,U] = DLLUF(A,b);

%% Use only backsub function to solve for x

disp('LUx = b; therefore, Ux = inv(L)*b, so the solution for x is: ')
x = backsub(cat(2,U,inv(L)*b));
disp('x = ')
disp(x)