%function FSSP_NC(do, meta, d1min, s1min)

do='d:\';

[fn_conc] = fssp_NC_file(do, d1min.DT, 1);

ncid_conc = netcdf.open(fn_conc, 'NC_WRITE');
netcdf.reDef(ncid_conc);
%define header
%fssp_NC_header_v2(ncid_conc, meta, s1min, 1);
%define dimension
[dmids] = fssp_NC_dim_v2(ncid_conc, length(s1min.E), 1);
%define variables
[vids] = fssp_NC_comm_var_v2(ncid_conc, s1min, dmids);
netcdf.close(ncid_conc);


%[fn_dist] = fssp_NC_file(do, d1min.DT, 2);
%ncid_conc = netcdf.open(fn_dist, 'NC_WRITE');
%netcdf.reDef(ncid_dist);
%fssp_NC_header_v2(ncid_dist, meta, s1min, 2);
%fssp_NC_dim_v2(ncid_dist,length(s1min.E), 2);
%fssp_NC_comm_var_v2(ncid_dist,s1min);
%netcdf.close(ncid_dist);