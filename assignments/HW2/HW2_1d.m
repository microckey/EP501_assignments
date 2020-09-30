% HW 2 Problem 1(d)

clear
clc
close all

load('testproblem.mat');

simforelmltlb(cat(2,A,eye(length(A(1,:)))));