function KiSq = KiSq(ydata,yfit,sigmay,n)
% n = Order of poly to be fitted
% sigmay = uncertainty of the data
% yfit = poly. to be fitted to the data
% ydata = data

% Degrees of Freedom
Nu = length(ydata) - (n + 1);

% Reduced Ki Squared
KiSq = sum((ydata - yfit).^2./sigmay.^2)/Nu;

end % function