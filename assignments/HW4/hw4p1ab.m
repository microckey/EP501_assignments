% Poly Fit
% HW 4 Pb 1ab

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

%% Plot of noisy data

load('test_lsq.mat')

figure, plot(x,ynoisy,'.','MarkerSize',7)
xlabel('x'), ylabel('y'), title('Polynomial Fit')
hold on

%% Linear Fit
% Order of Poly Being Fitted
n = 1;

% Set up the Jacobian for an elimination fit to a line
J = cat(2,ones(length(x),1));
for i =  1 : n
    xi = x(:).^i;
    J = cat(2,J,xi);
end % for

M=J'*J;
yprime=J'*ynoisy(:);
[Mmod,ord]=Gauss_elim(M,yprime);
avec=backsub(Mmod(ord,:))

yfit = 0;
for i = 1 : n+1
    yfit = yfit + avec(i)*x.^(i-1);
end % for

plot(x,yfit,'--','LineWidth',4);

%% Quadratic Fit
% Order of Poly Being Fitted
n = 2;

% Set up the Jacobian for an elimination fit to a line
J = cat(2,ones(length(x),1));
for i =  1 : n
    xi = x(:).^i;
    J = cat(2,J,xi);
end % for

M=J'*J;
yprime=J'*ynoisy(:);
[Mmod,ord]=Gauss_elim(M,yprime);
avec=backsub(Mmod(ord,:))

yfit2 = 0;
for i = 1 : n+1
    yfit2 = yfit2 + avec(i)*x.^(i-1);
end % for

plot(x,yfit2,'--','LineWidth',4);

%% MATLAB Built-in Fits
p1 = polyfit(x,ynoisy,1);
y1 = polyval(p1,x);
plot(x,y1,'LineWidth',2);

p2 = polyfit(x,ynoisy,2);
y2 = polyval(p2,x);
plot(x,y2,'LineWidth',2);

legend('Data Set','Linear Fit','Quadratic Fit','MATLAB Linear Fit','MATLAB Quadratic Fit');
hold off

%% Error Vectors & Residuals
EV1 = y1 - yfit;
EV2 = y2 - yfit2;

ErrorVectors = table(EV1,EV2)

R1 = sum((EV1).^2);
R2 = sum((EV2).^2);

Residuals = table(R1,R2)
