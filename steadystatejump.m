% neoclassical growth model allowing for two 50-period steady state
% convergences, allows for a sudden change in the middle.

clear;
clc;

% Initial conditions
A1=10;
alpha1=0.3;
beta1=0.9;
delta1=0.1;

% Sudden shift
A2=11;
alpha2=0.3;
beta2=0.9;
delta2=0.1;

T = 50;

% First steady state, initial at half kbar
kbar = ((1./(A1.*alpha1).*((1./beta1)-1+delta1))).^(1./(alpha1-1))
k0=kbar./2

% Second steady state, initial at first steady state
kbar_2 = ((1./(A2.*alpha2).*((1./beta2)-1+delta2))).^(1./(alpha2-1))
k00=kbar;

% Get the initial values
EulerFun = @(k) Euler(k,A1,alpha1,beta1,delta1,T,k0,kbar);
k1_initial=fsolve(EulerFun,k0.*ones(T+2,1));

% Second steady state
EulerFun = @(k) Euler(k,A2,alpha2,beta2,delta2,T,k00,kbar_2);
k1_jump=fsolve(EulerFun,k00.*ones(T+2,1));

% Combine the two sets of kt+1 results
kk=[k1_initial;k1_jump];

plot(kk(1:T*2),'k');
title('Neoclassical steady states with sudden technology change'),grid on;
xlabel('kt'),ylabel('kt+1');
text(T,k1_initial(end)-1,'A increases to 11');