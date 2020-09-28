% HW 1 Problem 2(c) & (d)
% Find the inverse

clear
clc
close all

load('testproblem.mat')

szA = size(A,1);
I = eye(szA);
A4GJ = cat(2,A,I); % concatenated matrix of A & I

%% Gauss-Jordan elimination to get A inverse and diaplay the result
GJelsol = GJel(A4GJ);
disp('The inverse matrix of A is:  ');
disp(GJelsol)

%% Display the MATLAB buil-in result
disp('Matlab,GNU/Octave built-in solution:  ');
disp(inv(A))

%% Compute & display the error
Errr = inv(A) - GJelsol;
disp('The error is:  ');
disp(Errr)
