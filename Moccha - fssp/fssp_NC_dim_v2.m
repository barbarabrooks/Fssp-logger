function [dmids] = fssp_NC_dim_v2(ncid, LE, ss)

dmids(1,1)= netcdf.defDim(ncid,'time',LE);
dmids(1,2) = netcdf.defDim(ncid,'latitude',LE);
dmids(1,3) = netcdf.defDim(ncid,'longitude',LE);

if ss == 2
    dmids(1,4) = netcdf.defDim(ncid,'index',100);
end
