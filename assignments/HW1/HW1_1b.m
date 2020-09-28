% HW 1 Problem 1(b)

clear
clc
close all

load('testproblem.mat')

fsoln = simforel(A,b);


% Awork=cat(2,A,b);
% fsoln = simforelmltlb(Awork);
% A\b