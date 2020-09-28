function y = simforelmltlb(Awork)

% HW 1 Problem 2 (a)
% Simple elim. fct. w/ multiple RHS

%% Illustrate vanilla forward elimination

nrefr = size(Awork,1);    % # of rows
nrefc = size(Awork,2);    % # of columns

%note that the elimination procedure coded below modifies the matrix B
Aworkut = Awork;

for ir1 = 2 : nrefr      %loop over rows from 2 to n performing elimination, this index marks what row we are starting the elimination from (i.e. using) for this particular column
    for ir2 = ir1 : nrefr                                     %this index marks the present position where elimination is being performed - i.e. where we are applying the elementary row operations
        fact=Aworkut(ir2,ir1-1);                                    %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        Aworkut(ir2,:)=Aworkut(ir2,:)-fact/Aworkut(ir1-1,ir1-1).*Aworkut(ir1-1,:);    %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
    end %for
end %for

disp('elim([Aref,bref]) = ');
disp(Aworkut);

%% Illustrate back substitution on B using provided Matlab function

% This function performs back substitution on an upper triangular matrix that has
% been modified by concatenating the RHS of the system.
% Note that B is assumed to be upper triangular at this point.

n = nrefr;              %number of unknowns in the system
nb = nrefc - nrefr;     % # of RHS
x = zeros(n,nb);                  %space in which to store our solution vector

for k = n+1 : nrefc
    x(n,k) = Aworkut(n,k)./Aworkut(n,n);          %finalized solution for last variables of all RHS
    for l = n-1 : -1 : 1
        x(l,k) = Aworkut(l,k);       %assume we're only dealing with a single right-hand side here.
        fact = Aworkut(l,l);         %diagonal element to be divided through doing subs for the ir2 row
        for ic = l+1 : n
            x(l,k) = x(l,k)-Aworkut(l,ic)*x(ic,k);
        end %for
        x(l,k)=x(l,k)/fact;      %divide once at the end to minimize number of ops
    end %for
end % for

y = x(1:n , n+1:nrefc);

disp('Elimination/back sub solution:  ');
disp(y);
% disp('Matlab,GNU/Octave built-in solution:  ');
% disp(A\b);

end % function