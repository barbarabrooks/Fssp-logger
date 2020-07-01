function fssp_NC_header_v2(fn_nc, meta, s1min, ss)

for n = 1 : length(meta)
    netcdf.putAtt(fn_nc, netcdf.getConstant('NC_GLOBAL'),meta{n,1},meta{n,2});
    
    if (strfind(meta{n,1},'time_coverage_start'))
        netcdf.putAtt(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},...
            datestr((min(s1min.E)./86400 + datenum(1970,1,1,0,0,0)),'YYYY-mm-DDTHH:MM:SS'));     
    end
    
    if (strfind(meta{n,1},'time_coverage_end'))
        netcdf.putAtt(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},...
            datestr((max(s1min.E)./86400 + datenum(1970,1,1,0,0,0)),'YYYY-mm-DDTHH:MM:SS'));     
    end
    
    if (strfind(meta{n,1},'geospatial_bounds'))
        %define top left bottom right
        max_lat = num2str(max(s1min.wind_lat));
        min_lat = num2str(min(s1min.wind_lat));
        max_lon = num2str(max(s1min.wind_lon));
        min_lon = num2str(min(s1min.wind_lon));
            
        %format (SW lattitude longitude, NE lattitude longitude) example (25.45N 18.22E, 20.22N 34.22E)
        sl=[min_lat,'N ',min_lon,'E, ',max_lat,'N ',max_lon,'E'];
        
        netcdf.putAtt(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},sl);     
    end
    
    if (strfind(meta{n,1},'last_revised_date'))
        netcdf.putAtt(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},datestr(now,'YYYY-mm-DDTHH:MM:SS'));
    end
end

if ss == 2
    netcdf.putAtt(fn_nc,netcdf.getConstant('NC_GLOBAL'),'measurement_technique','optical');
end    