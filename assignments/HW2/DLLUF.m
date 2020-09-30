function [L,U] = DLLUF(A,b)

% HW 2 Problem 1(a)
% Doolittle LU Factorization

%% Illustrate vanilla forward elimination
nref = length(b);               %system size for reference problem

L = eye(nref);
U = zeros(nref);
U(1,:) = A(1,:);

%note that the elimination procedure coded below modifies the matrix B
Awork = cat(2,A,b);          %This is our working version of the matrix used to perform elimination (i.e. it will be modified)
for ir1 = 2 : nref                                           %loop over rows from 2 to n performing elimination, this index marks what row we are starting the elimination from (i.e. using) for this particular column
    for ir2 = ir1 : nref                                     %this index marks the present position where elimination is being performed - i.e. where we are applying the elementary row operations
        fact = Awork(ir2,ir1-1);                                    %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        em = Awork(ir1-1,ir1-1);    % elimination multiplier
        L(ir2,ir1-1) = fact/em; % Update L according to the elimination multiplier
        Awork(ir2,:) = Awork(ir2,:)-fact/em*Awork(ir1-1,:);    %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
        U(ir1,ir2) = Awork(ir1,ir2);
    end %for
end %for

%% Display the L & U matrices from Doolittle factorization
disp('Doolittle LU factorization: ');
disp('L = ');
disp(L)
disp('U = ');
disp(U)

end % function