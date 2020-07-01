function [data, out] = fssp_out(d1min, s1min, table)

data.DT = d1min.DT;
data.E = d1min.E;
data.DoY = d1min.DoY;
data.D = d1min.fssp_fit.MD;
data.N = d1min.fssp_fit.N;
data.dNdD = d1min.fssp_fit.dNdD;
data.dNdlogD = d1min.fssp_fit.dNdlogD;
data.dN = d1min.fssp_fit.dN;
data.dD = d1min.fssp_fit.dD;
data.dlogD = d1min.fssp_fit.dlogD;
data.flag = d1min.fssp_fit.flag;

ix = find((table.DT(:,2) == data.DT(1,2)) & (table.DT(:,3) == data.DT(1,3)));
DT = table.DT(ix,:);
EA = table.EulerAngles(ix,:);
AA = table.Accel(ix,:);
RR = table.RotationRate(ix,:);

for n = 1 : length(data.E)
    %ship
    ix = find((s1min.DT(:,4) == data.DT(n,4)) & (s1min.DT(:,5) == data.DT(n,5)));
    if ~isempty(ix)
        data.lat(n,1) = s1min.wind_lat(ix(1));
        data.lon(n,1) = s1min.wind_lon(ix(1));
        data.cog(n,1) = s1min.cog(ix(1));
        data.sog(n,1) = s1min.sog(ix(1));
        data.heading(n,1) = s1min.heading(ix(1));
    else
        data.lat(n,1) = NaN;
        data.lon(n,1) = NaN;
        data.cog(n,1) = NaN;
        data.sog(n,1) = NaN;
        data.heading(n,1) = NaN;
    end
    clear ix
    %table
    ix = find((DT(:,4) == data.DT(n,4)) & (DT(:,5) == data.DT(n,5)));
    if ~isempty(ix)
        data.EulerAngles(n,:) = EA(ix(1),:);
        data.Accel(n,:) = AA(ix(1),:);
        data.RotationRate(n,:) = RR(ix(1),:);
    else
       data.EulerAngles(n,:) = ones(1,3).*NaN;
       data.Accel(n,:) = ones(1,3).*NaN;
       data.RotationRate(n,:) = ones(1,3).*NaN;
    end
end

%create singel data matix
names = fieldnames(data);
out=[];
for n= 1:length(names)
    out = [out, getfield(data, names{n})];
end
%replace NaNs
ix = find(isnan(out)==1);
if ~isempty(ix)
    out(ix) = -1e20;
end
