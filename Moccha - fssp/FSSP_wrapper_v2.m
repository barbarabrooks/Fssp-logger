%table_1minavg;

%di = 'D:\Projects\MOCCHA\DATA\FSSP\txt';
%do = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\raw';

%di = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\raw';
%do = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\1_min';

%di = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\1_min';
%do = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\1_min';
%di_2 = 'D:\Projects\MOCCHA\DATA\shipdata_matlab'; 

%di = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\1_min';
%do = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\1_min';

di = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\1_min';
do = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\Out';
do2 = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\Out\xlsx';
load('D:\Projects\MOCCHA\DATA\MT1minavg_matlab\MT1minavg.mat')

%di = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\Out';
%do = 'D:\Projects\MOCCHA\DATA\FSSP\matlab\NC';

list = dir(di);
%list2 = dir(di_2);

for n = 3 : length(list)
    %parse raw
    %fn = list(n).name;
    %display(fn)
    %fo = [fn(1:length(fn)-3), 'mat'];
    %data = parse_fssp_v2(fullfile(di, fn));

    %save(fullfile(do, fo),'data')
    %clear fn fo data
    
    %1 minavg
    %fn = list(n).name;
    %display(fn)
    %load(fullfile(di, fn))
    %d1min = fssp_1minavg(data);
    %save(fullfile(do,fn),'data', 'd1min')
    
    %add 1-min avg ship dat
    %fn_1 = list(n).name;
    %fn_2 = list2(n).name;
    %display(fn_1)
    %display(fn_2)
    %load(fullfile(di, fn_1))
    %load(fullfile(di_2, fn_2))
    %s1min = ship_1minavg(ship);
    %save(fullfile(do,fn_1),'data', 'd1min', 's1min')
     
    %correct fssp data
    %fn = list(n).name;
    %display(fn)
    %load(fullfile(di, fn))
    %d1min = fssp_1mincorr(d1min, s1min);
    %save(fullfile(do,fn),'data', 'd1min', 's1min')
    
    %spectra
    %fn = list(n).name;
    %display(fn)
    %load(fullfile(di, fn))
    %d1min = fssp_spectra(d1min);
    %save(fullfile(do,fn),'data', 'd1min', 's1min')
    
    %fit 6th order poly in dNdD space
    %fn = list(n).name;
    %display(fn)
    %load(fullfile(di, fn))
    %d1min = fssp_spectra_fit(d1min);
    %save(fullfile(do,fn),'data', 'd1min', 's1min')
    
    %QC
    %fn = list(n).name;
    %display(fn)
    %load(fullfile(di, fn))
    %d1min = fssp_spectra_fit_qc(d1min, s1min);
    %save(fullfile(do,fn),'data', 'd1min', 's1min')
    
    %set up final structure
    fn = list(n).name;
    display(fn)
    load(fullfile(di, fn))
    clear data
    [data, out] = fssp_out(d1min, s1min, table);
    save(fullfile(do,fn),'data')
    fo = [fn(1:length(fn)-3), 'xlsx'];
    xlswrite(fullfile(do2,fo),out);
end

%fn_meta = 'D:\Projects\MOCCHA\DATA\FSSP\fssp_meta_uol.xlsx';
%[~, meta, ~] = xlsread(fn_meta,'A2:B41');

%for n = 3 : length(list)
%    fn = list(n).name;
%    display(fn)
%    load(fullfile(di, fn))
%    FSSP_NC(do, meta, d1min, s1min)
%end