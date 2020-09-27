% HW1 1(c) & (d)

clear
clc
close all

load('lowertriang_testproblem.mat')

Lwork=cat(2,L,bL);

%% Illustrate forward substitution on B using provided Matlab function
fsoln = fwdsub(Lwork);
disp('Elimination/back sub solution:  ');
disp(fsoln);
disp('Matlab,GNU/Octave built-in solution:  ');
disp(L\bL);