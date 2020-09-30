% HW 2 Problem 1(c) & (d)

clear
clc
close all

load('testproblem.mat');

%% Problem 1(c): Lower & upper triang. matrices from the previous problem
La = [1.0000         0         0         0         0         0         0         0;
    0.4641    1.0000         0         0         0         0         0         0;
    -0.1350   -0.4295    1.0000         0         0         0         0         0;
    0.2876   -0.2767    0.0696    1.0000         0         0         0         0;
    -0.2974   -0.4159    0.3247    1.4176    1.0000         0         0         0;
    -0.3940   -1.0627   -0.3439    2.1578    8.1997    1.0000         0         0;
    0.9163    0.9053    0.9062   -0.7006    4.3450    0.8867    1.0000         0;
    0.1742   -0.0886   -0.1767    0.6487   -1.1912   -0.1647   -2.0441    1.0000];

Ua = [   -1.0149   -2.1321    2.1778   -0.2730   -0.7841   -0.4677   -0.2841   -0.2883;
    0    2.1349    0.1277    1.7030   -1.4414    0.0922    0.0452    0.4839;
    0         0   -2.1480    0.2136    1.1336    1.4554   -1.4883   -1.6670;
    0         0         0    0.8624   -0.8568   -0.8022    0.3901    1.3688;
    0         0         0         0    0.1172    1.3485   -0.9577    1.1407;
    0         0         0         0         0   -8.6038    6.3411  -11.5207;
    0         0         0         0         0         0    0.7162    7.2391;
    0         0         0         0         0         0         0   13.5981];

%% Display the results
xLU = backsub(cat(2,Ua,fwdsub(cat(2,La,b))));
disp('Solution for x using LU factorization (Rounded)')
disp(xLU)

xmat = A\b;
disp('Solution for x using MATLAB bulit-in function')
disp(xmat)

%% Remarks
disp('Because there are some rounding errors, let''s re-calculated the solution using the original L & U matrices.')

%% Let's do it again
[L,U] = DLLUF(A,b);
xLUb = backsub(cat(2,U,fwdsub(cat(2,L,b))));
xLUb2 = backsub(cat(2,U,fwdsub(cat(2,L,b2))));
xLUb3 = backsub(cat(2,U,fwdsub(cat(2,L,b3))));

xmat2 = A\b2;
xmat3 = A\b3;

disp('Solution for x using LU factorization (b)')
disp(xLUb)
disp('Solution for x using MATLAB bulit-in function (b)')
disp(xmat)
disp('Error: ')
disp(xLUb - xmat)

disp('Solution for x using LU factorization (b2)')
disp(xLUb2)
disp('Solution for x using MATLAB bulit-in function (b2)')
disp(xmat2)
disp('Error: ')
disp(xLUb2 - xmat2)

disp('Solution for x using LU factorization (b3)')
disp(xLUb3)
disp('Solution for x using MATLAB bulit-in function (b3)')
disp(xmat3)
disp('Error: ')
disp(xLUb3 - xmat3)


%% Problem 1(d): Find the inverse A
n = length(A(1,:));
I = eye(n);
Ainv = zeros(n);

for k = 1 : n
    Ainv(:,k) = backsub(cat(2,U,fwdsub(cat(2,L,I(:,k)))));
end % for

disp('Inverse A using L & U: ')
disp(Ainv)
invAmat = inv(A);
disp('Inverse A using MATLAB built-in function: ')
disp(invAmat)
disp('Error: ')
disp(inv(A) - Ainv)