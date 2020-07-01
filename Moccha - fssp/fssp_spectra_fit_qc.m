function d1min = fssp_spectra_fit_qc(d1min, s1min)

%flag 0 - not used
%flag 1 - good data
%flag 2 - insufficient data to fit spectra bad data
%flag 3 - N > 1000 - bad data
%flag 4 - wind from blocked area of ship 90 - 240. Wind relative ) is wind
%from the bow - bad data
%flag 5 - iced inlet suspepct data
%flag 6 - part blockage - bad data
%flag 7 - blockage - bad data
d1min.fssp_fit.flag = ones(length(d1min.DoY),1);

%N> 1000
ix = find(d1min.fssp_fit.N > 1000);
if ~isempty(ix)
    d1min.fssp_fit.flag(ix) =  3;
end

%Wind direction flag
ix = find((s1min.wind_dir_rel > 90) & (s1min.wind_dir_rel < 240));
HR = s1min.DT(ix,4);
MN = s1min.DT(ix,5);
if ~isempty(ix)
    for n=1:length(d1min.E)
        ixx = find((HR==(d1min.DT(n,4))) & ((MN==(d1min.DT(n,5)))));
        if ~isempty(ixx)
            d1min.fssp_fit.flag(n) = 4;
        end
    end
end

if d1min.DT(1,3) == 19
    ix = find((d1min.DT(:,4)== 13) & (d1min.DT(:,5)> 17));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
    
    ix = find((d1min.DT(:,4)== 19) & (d1min.DT(:,5)> 16));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
end

if d1min.DT(1,3) == 20
    ix = find((d1min.DT(:,4)== 8) & (d1min.DT(:,5)> 48));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
    
    ix = find((d1min.DT(:,4)== 13) & (d1min.DT(:,5)> 50));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
    
    ix = find((d1min.DT(:,4)== 19) & (d1min.DT(:,5)> 3));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
end

if d1min.DT(1,3) == 21
    ix = find((d1min.DT(:,4)== 9) & (d1min.DT(:,5)> 2));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
    
    ix = find((d1min.DT(:,4)== 14) & (d1min.DT(:,5)> 12));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 6;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 6; 
    end
end

if d1min.DT(1,3) == 22
    ix = find((d1min.DT(:,4)== 0) & (d1min.DT(:,5)> 47));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end

    ix = find((d1min.DT(:,4)== 14) & (d1min.DT(:,5)> 2));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
end

if d1min.DT(1,3) == 23
    ix = find((d1min.DT(:,4)== 9) & (d1min.DT(:,5)> 6));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
end

if d1min.DT(1,3) == 24
    ix = find((d1min.DT(:,4)== 8) & (d1min.DT(:,5)> 52));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 7;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 7; 
    end
    
    ix = find((d1min.DT(:,4)== 19) & (d1min.DT(:,5)> 15));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 6;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 6; 
    end
end

if d1min.DT(1,3) == 25
    ix = find((d1min.DT(:,4)== 15) & (d1min.DT(:,5)> 26));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 6;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 6; 
    end 
end

if d1min.DT(1,3) == 26
    ix = find((d1min.DT(:,4)== 11) & (d1min.DT(:,5)> 13));
    if (ix(1)-60) < 1
       d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
    
    ix = find((d1min.DT(:,4)== 23) & (d1min.DT(:,5)> 3));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end
end

if d1min.DT(1,3) == 27
    ix = find((d1min.DT(:,4)== 9) & (d1min.DT(:,5)> 48));
    if (ix(1)-60) < 1
       d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end    
end

if d1min.DT(1,3) == 31
    ix = find((d1min.DT(:,4)== 15) & (d1min.DT(:,5)> 32));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 5;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 5; 
    end    
end

if ((d1min.DT(1,2) == 9) & (d1min.DT(1,3) == 4))
    ix = find((d1min.DT(:,4)== 9) & (d1min.DT(:,5)> 2) );
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 6;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 6; 
    end
end

if ((d1min.DT(1,2) == 9) & (d1min.DT(1,3) == 5))
    ix = find((d1min.DT(:,4)== 8) & (d1min.DT(:,5)> 47));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 7;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 7; 
    end
end

if ((d1min.DT(1,2) == 9) & (d1min.DT(1,3) == 6))
    ix = find((d1min.DT(:,4)== 10) & (d1min.DT(:,5)> 26));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 7;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 7; 
    end
    
    ix = find((d1min.DT(:,4)== 22) & (d1min.DT(:,5)> 40));
    if (ix(1)-60) < 1
        d1min.fssp_fit.flag(1:ix(1)) = 7;
    else
       d1min.fssp_fit.flag((ix(1)-60):ix(1)) = 7; 
    end
end
