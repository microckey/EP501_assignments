% Midterm Problem 3 (d)
% Polynomial division by the root

clear
clc
close all

%% Coefficients of the poly & divisor
o = 5; % Order of the poly
A(:,1) = [1;-15;85;-225;274;-120]; % Coefficients of the poly (Decreasing order)
N = 1; % Divide the poly by (x - N)

%% Division
% Reordering the coefficients
for i = 1 : o+1
    Ap(i,1) = A(o-i+2,1);    % Increasing order
end % for

% Division
Qi(o+1,1) = Ap(o+1);
for i = o : -1 : 1
    Qi(i,1) = Ap(i) + N*Qi(i+1,1);    % Increasing order
end % for

R = Qi(1)   % Remainder

% Coefficients for Q
for i = 1 : o
    Q(i,1) = Qi(o-i+2,1);    % Decreasing order
end % for

disp('Q4 = ')
disp(Q)