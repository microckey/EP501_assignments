function x = solveqe(A)

% Solves quadratic equation analitically

p = sqrt((A(2)^2/(4*A(1))-A(3))/A(1));
q = A(2)/(2*A(1));
x(1,:) = p - q;
x(2,:) = -p - q;

end % function