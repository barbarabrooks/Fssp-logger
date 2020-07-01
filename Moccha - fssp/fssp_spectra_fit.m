function d1min = fssp_spectra_fit(d1min)
% fit 6th order poly in log10(dN\dD) space

d1min.fssp_fit.MD = ones(length(d1min.DoY),100).*NaN;
d1min.fssp_fit.dNdD = ones(length(d1min.DoY),100).*NaN;
d1min.fssp_fit.N= ones(length(d1min.DoY),1).*NaN;        
d1min.fssp_fit.dN= ones(length(d1min.DoY),100).*NaN;
d1min.fssp_fit.dD = ones(length(d1min.DoY),100).*NaN;
d1min.fssp_fit.dlogD = ones(length(d1min.DoY),100).*NaN;
d1min.fssp_fit.dNdlogD = ones(length(d1min.DoY),100).*NaN; 

for n = 1 : length(d1min.E)
    dNdD = d1min.fssp_conc.dNdD(n,:);
    ix = find(dNdD>0);
    if length(ix) > 18
        %fit
        Y1 = log10(dNdD(ix));
        X1 = log10(d1min.fssp_conc.MD(ix));
        X_min = min(d1min.fssp_conc.MD(ix));
        X_max = max(d1min.fssp_conc.MD(ix));
        p=polyfit(X1,Y1,6);
            
        %create new ND, dD, dlog D
        X2=log10(X_min:((X_max-X_min)/100):X_max); 
        XX2=10.^X2;
        Y2=polyval(p,X2);
        YY2=10.^Y2;
        dD = XX2(2:end) - XX2(1:100);
        dN = YY2(1:100) .* dD;
        N = sum(dN);
        dlogD = log10(XX2(2:end)) - log10(XX2(1:100));
        dNdlogD = dN./dlogD;
        
        d1min.fssp_fit.MD(n,:) = XX2(1:100);
        d1min.fssp_fit.dNdD(n,:) = YY2(1:100);
        d1min.fssp_fit.dN(n,:) = dN;
        d1min.fssp_fit.dD(n,:) = dD;
        d1min.fssp_fit.dlogD(n,:) = dlogD;
        d1min.fssp_fit.dNdlogD(n,:) = dNdlogD;
        d1min.fssp_fit.N(n) = N;    
    end
end