function y = Euler(k,A,alpha,beta,delta,T,k0,kbar)
    y = zeros(T,1);
    
    y = -(A.*k(1:end-2).^alpha-k(2:end-1)+(1-delta).*k(1:end-2))+(beta.*((A.*alpha.*k(2:end-1).^(alpha-1)+1-delta))).^(-1).*(A.*k(2:end-1).^alpha-k(3:end)+(1-delta).*k(2:end-1));

    y = [y ; k(1)-k0 ; k(T+1) - kbar];
end