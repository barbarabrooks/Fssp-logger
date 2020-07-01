function [fn] = fssp_NC_file(do, DT, ss)

f1 = 'uol-fssp100-2'; %instrument name
f2 = 'oden'; %platform name
mm = int2str(DT(1,2));
if length(mm)<2
    mm = ['0', mm];
end
dd = int2str(DT(1,3));
if length(dd)<2
    dd = ['0', dd];
end
f3 = [int2str(DT(1,1)), mm, dd]; %date yyyymmdd
if ss == 1
    f4 = 'aerosol-concentration';
else
    f4 = 'aerosol-size-distribution';
end
f5 = 'v1';
f6 = '.nc';
fn = [do, f1, char(95),  f2, char(95), f3, char(95), f4, char(95), f5, f6];

%Create a NetCDF-4 file that uses the classic model
mode = netcdf.getConstant('NETCDF4');
mode = bitor(mode,netcdf.getConstant('CLASSIC_MODEL'));
ncid = netcdf.create(fn, mode);

%close file
netcdf.close(ncid);