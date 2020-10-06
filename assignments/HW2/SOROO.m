function [x,tbl] = SOR(x0,A,b,tol,verbose)

% Optimal omega

%% Check the inputs
narginchk(3,5);
if nargin<4
    tol=1e-6;
end %if
if nargin<5
    verbose=false;
end %if

%% MATLAB Built-in Soln for x
xsolnmat = A\b;


%% Setup iterations
maxit=1000;    %max number of iterations
n=size(A,1);  %system size
tbl = [];   % Store the relaxation parameter & corresponding it. #
kit = 0;    % # of it. for omega
xsoln = [];
errr = [];

%% Perform iterations

for k = -99 : 1 : 99 %  test 0 < omega < 2
    omega = 1; % relaxation parameter
    it = 1;
    kit = kit + 1;
    omega = omega + k*0.01;
    residual=10*ones(n,1);
    difftot=1e3+tol;   %max sure we enter iterations
    x=x0;
    while(difftot > tol && it <= maxit)
        difftotprev = difftot;
        resprev = residual;
        xprev = x;
        for i=1:n
            residual(i)=b(i);
            for j=1:n
                residual(i) = residual(i) - A(i,j)*xprev(j);
            end %for
            x(i) = xprev(i) + omega*residual(i)/A(i,i);
        end %for
        difftot=sum(abs(residual-resprev));
        
        %     if (verbose)
        %         fprintf('x= ');
        %         for i=1:n
        %             fprintf('%f   ',x(i));
        %         end %for
        %         fprintf('\n');
        %         fprintf('it=%d; difftot = %e\n',it,difftot);
        %     end %if
        
        %     if (difftot>difftotprev & it>2)
        %         error('Solution appears to be diverging, check diagonal dominance...')
        %     end %if
        it=it+1;
    end %while
    
    tbl(1,kit) = omega;     % Store value of omega
    tbl(2,kit) = it - 1;    % Store value of it. #
    xsoln(:,kit) = x;
    err(:,kit) = xsolnmat - x;
    
end % for

% nit=it-1;
% if (nit==maxit)
%     warning('Solution may not have converged fully...')
% end %if

plot(tbl(1,:),tbl(2,:),'LineWidth',3)
xlabel('omega (Relaxation Parameter)')
ylabel('# of Iterations Required')
title('Relaxation Parameter vs. # of Iterations Rqd.')

end %function
