function i = findi(xi,xprime)

% xi = indep. var.
% xprime = a pt. to which the data are to be interpolated

k = 1;
t = xi(k);

while t <= xprime
    if k < length(xi)
        k = k + 1;
        t = xi(k);
    else
        k = k + 1;
        t = xprime + 1; % Get out of the loop
    end % if
end % while
i = k - 1;
end % function