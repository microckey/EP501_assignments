% Solve a diagonally dominant system using Succesice-Over_Relaxation method
% HW 2 Problem 2(b)

clear
clc
close all

load('iterative_testproblem.mat')

nit= size(Ait,1);
x0 = zeros(nit,1);
tol=1e-9;
% disp('Verbose Jacobi iterations:  ')
[xit,iterations]=SOR(x0,Ait,bit,tol,true);

disp('Solution with SOR method:  ')
disp(xit);

xmat = Ait\bit;
disp('Matlab built-in solution:  ')
disp(xmat);

err = xmat - xit;
disp('Error: ')
disp(err)

disp('Number of iterations required and tolerance:  ')
disp(iterations);
disp(tol);

table(xit, xmat, err)