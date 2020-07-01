function d1min = fssp_spectra(d1min)

D = fssp_diam_bins();
MD1 = [D.MD(1,:) D.MD(2,:) D.MD(3,:), D.MD(4,:)];
[MD,IX] = sort(MD1);
dD1 = [D.dD(1,:) D.dD(2,:) D.dD(3,:), D.dD(4,:)];
dD = dD1(IX);
dlogD1 = [D.dlogD(1,:) D.dlogD(2,:) D.dlogD(3,:), D.dlogD(4,:)];
dlogD = dlogD1(IX);

for n = 1 : length(d1min.E)
    %total number
    d1min.fssp_conc.N(n,:) = sum(sum(d1min.fssp_corr(n,:,:))); 
    n0 =  reshape(d1min.fssp_corr(n,1,:),1,15);
    n1 =  reshape(d1min.fssp_corr(n,2,:),1,15);
    n2 =  reshape(d1min.fssp_corr(n,3,:),1,15);
    n3 =  reshape(d1min.fssp_corr(n,4,:),1,15); 
    
    dN1 = [n0 n1 n2 n3];
    dN = dN1(IX);
    dNdD = dN./dD;
    dNdlogD = dN./dlogD;
    
    d1min.fssp_conc.dNdD(n,:) = dNdD;  
    d1min.fssp_conc.dN(n,:) = dN; 
     d1min.fssp_conc.dNdlogD(n,:) = dNdlogD;
end 
 d1min.fssp_conc.MD = MD; 
 d1min.fssp_conc.dD = dD; 
 d1min.fssp_conc.dD = dlogD; 
 
 