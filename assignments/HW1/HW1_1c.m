% HW 1 Problem 1(c) & (d)
% Show the forward sub. function works

clear
clc
close all

load('lowertriang_testproblem.mat')

Lwork=cat(2,L,bL); % concatenated matrix

%% Illustrate forward substitution on B using provided Matlab function
fsoln = fwdsub(Lwork);
disp('Elimination/back sub solution:  ');
disp(fsoln);

disp('Matlab,GNU/Octave built-in solution:  ');
fmat = L\bL;
disp(fmat);

Errr = fmat - fsoln;
disp('The error is:  ');
disp(Errr);