function [vids] = fssp_NC_comm_var_v2(ncid, s1min, dmids)

%time
%create the variable
vids(1,1) = netcdf.defVar(ncid, 'time','double', dmids(1));
%add varible attributes
netcdf.putAtt(ncid, vids(1,1), 'type', 'float64');
netcdf.putAtt(ncid, vids(1,1), 'units', 'seconds since 1970-01-01 00:00:00');
netcdf.putAtt(ncid, vids(1,1), 'standard_name', 'time');
netcdf.putAtt(ncid, vids(1,1), 'long_name', 'Time (seconds since 1970-01-01 00:00:00)');
netcdf.putAtt(ncid, vids(1,1), 'axis', 'T');
netcdf.putAtt(ncid, vids(1,1), 'valid_min', min(s1min.E));
netcdf.putAtt(ncid, vids(1,1), 'valid_min', max(s1min.E));
netcdf.putAtt(ncid, vids(1,1), 'calendar', 'standard');

%latitude
%create the variable
vids(1,2) = netcdf.defVar(ncid, 'latitude','double', dmids(2));
netcdf.defVarFill(ncid, vids(1,2),false, -1e20);
%add varible attributes
netcdf.putAtt(ncid, vids(1,2), 'type', 'float32');
netcdf.putAtt(ncid, vids(1,2), 'units', 'degrees_north');
netcdf.putAtt(ncid, vids(1,2), 'standard_name', 'latitude');
netcdf.putAtt(ncid, vids(1,2), 'long_name', 'Latitude');
netcdf.putAtt(ncid, vids(1,2), 'axis', 'Y');
netcdf.putAtt(ncid, vids(1,2), 'valid_min', single(min(s1min.wind_lat)));
netcdf.putAtt(ncid, vids(1,2), 'valid_max', single(max(s1min.wind_lat)));

%longitude
%create the variable
vids(1,3) = netcdf.defVar(ncid, 'longitude','double', dmids(3));
netcdf.defVarFill(ncid, vids(1,3),false, -1e20);
%add varible attributes
netcdf.putAtt(ncid, vids(1,3), 'type', 'float32');
netcdf.putAtt(ncid, vids(1,3), 'units', 'degrees_east');
netcdf.putAtt(ncid, vids(1,3), 'standard_name', 'longitude');
netcdf.putAtt(ncid, vids(1,3), 'long_name', 'Longitude');
netcdf.putAtt(ncid, vids(1,3), 'axis', 'X');
netcdf.putAtt(ncid, vids(1,3), 'valid_min', single(min(s1min.wind_lon)));
netcdf.putAtt(ncid, vids(1,3), 'valid_max', single(max(s1min.wind_lon)));