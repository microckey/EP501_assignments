% HW 1 Problem 2 (a)
% Simple elim. test w/ multiple RHS

clear
clc
close all

load('testproblem.mat')

Awork=cat(2,A,b,b2,b3);

fsoln = simforelmltlb(Awork);

disp('Matlab,GNU/Octave built-in solution:  ');
x1 = A\b;
x2 = A\b2;
x3 = A\b3;
matlabans = cat(2,x1,x2,x3);
disp(matlabans)

%% Compute & display the error
Errr = matlabans - fsoln;
disp('The error is:  ');
disp(Errr)
