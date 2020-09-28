% HW 1 Problem 3 (b)
% Use Gaussian elimination to get determinant

clear
clc
close all

load('testproblem.mat')

% %% random problem generator
% nref=100;                %system size for larger reference problem
% A=randn(nref,nref);    %augmented matrix containing RHS of system of equations, in practice you'd want to check conditioning...
% b=randn(nref,1);    %RHS


%% Use the Gaussian elimination function to solve the same system (include scaled pivoting)
[Amod,ord,nuroich,detA]=Gel(A,b);

disp('Elimination with scaled pivoting on matrix:  ');
disp(Amod(ord,:));
xgauss=backsub(Amod(ord,:));
disp('Back substitution solution using Gaussian elimination result:  ');
disp(xgauss);


%% Print step by step solution (Gauss elimination) for a simple system to illustrate
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
[Amodsmall,ord]=Gauss_elim(A,b,true);
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');


%% Compare against built in MATLAB solution
xmat=A\b;
disp('Built-in MATLAB solution');
disp(xmat);
Errrsol = xmat - xgauss;
disp('The difference is (sol for x): ')
disp(Errrsol)


%% MATLAB built-in sol. 4 det.
dmat = det(A);
disp('Built-in MATLAB solution for determinant');
disp(dmat);
Errrdet = dmat - detA;
disp('The difference is (determinant): ')
disp(Errrdet)