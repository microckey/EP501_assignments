% HW 2 Problem 1(b)

clear
clc
close all

load('testproblem.mat');

% A = [80 -20 -20; -20 40 -20; -20 -20 130]
% b = [20 20 20]'

[Awork,L,U] = DLLUF(A,b);
