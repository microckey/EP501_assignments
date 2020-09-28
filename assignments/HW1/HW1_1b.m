% HW 1 Problem 1(b)
% Demonstrate simple forward elim. & back sub. method

clear
clc
close all

load('testproblem.mat')


%% Use the simple forward elimination function to solve the same system (exclude scaled pivoting)
[Awork,xsoln,xmat,Errr] = simforel(A,b);

%% Use the Gaussian elimination function to solve the same system (include scaled pivoting)
[Amod,ord]=Gauss_elim(A,b);

xgauss=backsub(Amod(ord,:));
disp('Back substitution solution using Gaussian elimination result:  ');
disp(xgauss);

%% Compare against Gaussian elimination function result
Errr = xgauss - xsoln;
disp('The error is:  ');
disp(Errr);