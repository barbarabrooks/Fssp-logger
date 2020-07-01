function d1min = fssp_1minavg(data)

% create 1 min avga
cc = 0;
for h = 0 : 23
    for m = 0 : 59
        ix = find((data.DT(:,4) == h) & (data.DT(:,5) == m));
        if ~isempty(ix)
            cc = cc + 1;
            d1min.DT(cc,1) = data.DT(ix(1),1);
            d1min.DT(cc,2) = data.DT(ix(1),2);
            d1min.DT(cc,3) = data.DT(ix(1),3);
            d1min.DT(cc,4) = h;
            d1min.DT(cc,5) = m;
            d1min.DT(cc,6) = 0;
            [DoY, S, E]=file_times(d1min.DT');
            d1min.DoY=DoY'; d1min.E=E'; d1min.S=S';
            if length(ix) == 1
                d1min.fssp(cc,:,:) = data.fssp(ix,:,:);
            else
               ro =  reshape(data.fssp(ix,1,:),length(ix),15);
               r1 =  reshape(data.fssp(ix,2,:),length(ix),15);
               r2 =  reshape(data.fssp(ix,3,:),length(ix),15);
               r3 =  reshape(data.fssp(ix,4,:),length(ix),15);
               d1min.fssp_avg(cc,1,:) = mean(ro);
               d1min.fssp_avg(cc,2,:) = mean(r1);
               d1min.fssp_avg(cc,3,:) = mean(r2);
               d1min.fssp_avg(cc,4,:) = mean(r3);
               d1min.fssp_tot(cc,1,:) = sum(ro);
               d1min.fssp_tot(cc,2,:) = sum(r1);
               d1min.fssp_tot(cc,3,:) = sum(r2);
               d1min.fssp_tot(cc,4,:) = sum(r3);
            end
        end
    end
end