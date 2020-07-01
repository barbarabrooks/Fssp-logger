function  d1min = fssp_1mincorr(d1min, s1min)

%Effective_sampling_area = 0.235; %mm2
%Effective_sampling_area = 0.235e-2; %cm2
%Aspiration_fan_measured = 21.3; %m s-1
%Aspiration_fan_measured = 2130; %cm s-1

%SampleVolume = Effective_sampling_area * Aspiration_fan_measured; %cc s-1

%concentration  = total counted in a given sampling interval / total volume
%in sampling interval
%fssp is in auto ranging so only 1/4 of the sampling interval spent
%measuring on any one range
%Total fssp = 4 * fssp measured in sampling period 
%vol(cc) = SampleVolume(1 + WS(ms-1)/(Aspiration_fan_measured(ms-1)) * SampleInterval

SampleVolume = 5.01; %cc s-1
SampleInterval = 1; %s if using fssp_avg
%SampleInterval = 60; %s if using fssp_tot

d1min.fssp_corr = zeros(size(d1min.fssp_avg));

for n = 1 : length(d1min.DoY)
    ix = find((s1min.DT(:,4) == d1min.DT(n,4))&(s1min.DT(:,5) == d1min.DT(n,5)));
    if ~isempty(ix)
        WS = s1min.wind_spd_rel(ix); %m s-1
        vol = SampleVolume * (1 + (WS / 21.3)) * SampleInterval; %cc
        ro =  reshape(d1min.fssp_avg(n,1,:),1,15);
        r1 =  reshape(d1min.fssp_avg(n,2,:),1,15);
        r2 =  reshape(d1min.fssp_avg(n,3,:),1,15);
        r3 =  reshape(d1min.fssp_avg(n,4,:),1,15);
        d1min.fssp_corr(n,1,:) = ro .* 4 ./ vol;
        d1min.fssp_corr(n,2,:) = r1 .* 4 ./ vol;
        d1min.fssp_corr(n,3,:) = r2 .* 4 ./ vol;
        d1min.fssp_corr(n,4,:) = r3 .* 4 ./ vol;
    end
end