function [x,nit] = tridiag(A,b)

% Midterm Problem 1(a)
% A is a tridiagonal matrix
% Thomas algorithm

%% Check the size of A
n=size(A,1);  %system size

%% Store the tridiagonal elements in A'
    for i = 2 : n
        Ap(i,1) = A(i,i-1);
    end % for
    for i = 1 : n
        Ap(i,2) = A(i,i);
    end % for
    for i = 1 : n - 1
        Ap(i,3) = A(i,i+1);
    end % for
    
%% Elimination
nit = 0;
    for i = 2 : n
        em = Ap(i,1)/Ap(i-1,2); % Store the elimination multiplier
        Ap(i,2) = Ap(i,2) - em*Ap(i-1,3);
        b(i) = b(i) - em*b(i-1);
        nit = nit + 3;
    end % for
    x(n,1) = b(n)/Ap(n,2);
    nit = nit + 1;
    for i = n-1 : -1 : 1
        x(i,1) = (b(i) - Ap(i,3)*x(i+1))/Ap(i,2);
        nit = nit + 2;
    end %for

end %function
