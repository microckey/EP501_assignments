% Evaluate performance and scaling of Gaussian elimination, Jacobi
% iteration, and Thomas algorithm by solving systems of different
% size and timing the solves

clear
clc
close all

nvals=1:1:50;
testtimes=zeros(size(nvals));
lrep=10;     %how many times to repeat each test

%% Gaussian elimination
disp('Start of tests of Gaussian-elimination scaling');
for in=1:numel(nvals)
    nlarge=nvals(in);
    Blarge=diag(-1*ones(nlarge-1,1),-1)+diag(-1*ones(nlarge-1,1),1)+diag(4*ones(nlarge,1),0);    %this must be diagonally dominant or else the method won't converge
    blarge=ones(nlarge,1);
    
    for irep=1:lrep     %benchmark will repeat the same solution several times to eliminate random variations from CPU load, etc.
        tstart=cputime;
        [Blargemod,ordlarge]=Gauss_elim(Blarge,blarge);
        xlarge=backsub(Blargemod(ordlarge,:));
        tend=cputime;
        testtimes(in)=testtimes(in)+(tend-tstart)/lrep;
    end %for
    disp([' GE solution for system of size ',num2str(nlarge),' takes average time ',num2str(testtimes(in)),' s']);
end %for

TT(:,1) = testtimes';

figure(1);
plot(nvals,testtimes,'-o','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','blue','MarkerFaceColor','blue')
xlabel('system size');
ylabel('time to solve (s)');
title('Empirically Determined Performance');

%% Jacobi iteration
disp('Start of tests for Jacobi iteration');
tol=1e-9;
testtimes=zeros(size(nvals));
for in=1:numel(nvals)
    nlarge=nvals(in);
    Blarge=diag(-1*ones(nlarge-1,1),-1)+diag(-1*ones(nlarge-1,1),1)+diag(4*ones(nlarge,1),0);    %this must be diagonally dominant or else the method won't converge
    blarge=ones(nlarge,1);

    for irep=1:lrep     %benchmark will repeat the same solution several times to eliminate random variations from CPU load, etc.
        tstart=cputime;
        x0=randn(nlarge,1);
        [xit,iterations]=Jacobi(x0,Blarge,blarge,tol,false);
        tend=cputime;
        testtimes(in)=testtimes(in)+(tend-tstart)/lrep;
    end %for
    disp([' JI solution for system of size ',num2str(nlarge),' takes average time ',num2str(testtimes(in)),' s']);
end %for

TT(:,2) = testtimes';

figure(1);
hold on
plot(nvals,testtimes,'-^','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','green','MarkerFaceColor','green')

%% Thomas algorithm
disp('Start of tests for tridiag solver');
% tol=1e-9;
testtimes=zeros(size(nvals));
for in=1:numel(nvals)
    nlarge=nvals(in);
    Blarge=diag(-1*ones(nlarge-1,1),-1)+diag(-1*ones(nlarge-1,1),1)+diag(4*ones(nlarge,1),0);    %this must be diagonally dominant or else the method won't converge
    blarge=ones(nlarge,1);

    for irep=1:lrep     %benchmark will repeat the same solution several times to eliminate random variations from CPU load, etc.
        tstart=cputime;
        [xit,iterations]=tridiag(Blarge,blarge);
        tend=cputime;
        testtimes(in)=testtimes(in)+(tend-tstart)/lrep;
    end %for
    disp([' TA solution for system of size ',num2str(nlarge),' takes average time ',num2str(testtimes(in)),' s']);
end %for

TT(:,3) = testtimes';
disp('Time required for GE, JI, & TA (s)')
disp(TT)

figure(1);
hold on
plot(nvals,testtimes,'-s','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','red')
legend('Gauss elim.','Jacobi it.','Thomas algorithm')

