function SOL = GJel(Awork)

% HW 1 Problem 2 (b)
% Gauss-Jordan elimination
% The input is the concatenated matrix Awork = [2, A, b, b2, ... , bn]

%% Illustrate vanilla forward elimination

nrefr = size(Awork,1);    % # of rows
nrefc = size(Awork,2);    % # of columns

Aworkut = Awork;

for ir1 = 2 : nrefr      %loop over rows from 2 to nrefr performing elimination
    for ir2 = ir1 : nrefr        %this index marks the present position where elimination is being performed
        fact = Aworkut(ir2,ir1-1);    %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        Aworkut(ir2,:) = Aworkut(ir2,:) - fact/Aworkut(ir1-1,ir1-1).*Aworkut(ir1-1,:);    %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
    end %for
end %for

disp('The upper triangular matrix is: ');
disp(Aworkut);

%% Illustrate vanilla backward elimination

Aworkdiag = Aworkut;

for mr1 = nrefr-1 : -1 : 1      %loop over rows from nrefr - 1 to 1 performing elimination
    for mr2 = mr1 : -1 : 1       %this index marks the present position where elimination is being performed
        fact2 = Aworkdiag(mr2,mr1+1);   %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        Aworkdiag(mr2,:) = Aworkdiag(mr2,:) - fact2/Aworkdiag(mr1+1,mr1+1).*Aworkdiag(mr1+1,:);    %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
    end %for
end %for

disp('The diagonal matrix is: ');
disp(Aworkdiag);

%% Get Reduced Row-Echelon Form

AworkRE = Aworkdiag;

for dg = 1 : nrefr
AworkRE(dg,:) = AworkRE(dg,:)./AworkRE(dg,dg);
end % for

disp('The reduced row-echelon form is: ');
disp(AworkRE);

%% Get the solution
SOL = AworkRE(1:end , nrefr+1:end);

end % function