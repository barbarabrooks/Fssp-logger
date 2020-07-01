function data = fssp_diam_bins()
%LD : lower diameter of a bin
%UD : upper diameter of a bin
%MD : midpointof a bin
%dD : bin width
%dlogD: width of bin in log10 space
%all parameters ordered in termsof range and bin 

%range 0
delta = 3;
for jj = 1 : 15
    LD(1, jj) = 2 + (delta * (jj-1));
    UD(1, jj) = LD(1, jj) + delta;
end
  
%range 1
delta = 2;
for jj = 1 : 15
    LD(2, jj) = 2 + (delta * (jj-1));
    UD(2, jj) = LD(2, jj) + delta;
end 

%range 2
delta = 1;
for jj = 1 : 15
    LD(3, jj) = 1 + (delta * (jj-1));
    UD(3, jj) = LD(3, jj) + delta;
end

%range 3
delta = 0.5;
for jj = 1 : 15
    LD(4, jj) = 0.5 + (delta * (jj-1));
    UD(4, jj) = LD(4, jj) + delta;
end

for ii = 1:4
    for jj = 1:15
        dD(ii,jj) = UD(ii, jj) - LD(ii, jj);
        MD(ii,jj) = LD(ii, jj) + dD(ii, jj)/2;
        dlogD(ii, jj) = log10(UD(ii, jj)) - log10(LD(ii, jj));
    end
end

data.LD = LD;
data.UD = UD;
data.dD = dD;
data.MD = MD;
data.dlogD = dlogD;