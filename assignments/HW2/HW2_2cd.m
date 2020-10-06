% Solve a diagonally dominant system using Succesice-Over_Relaxation method
% HW 2 Problem 2(c) & (d)

clear
clc
close all

load('iterative_testproblem.mat')

nit = size(Ait,1);
x0 = zeros(nit,1);
tol = 1e-9;

[xit,tbl] = SOROO(x0,Ait,bit,tol,true);