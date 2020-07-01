fn='D:\FSSP_20180615.txt';

sizes = fssp_diam_bins;
fssp = parse_fssp(fn);
plot_fssp(sizes, fssp);
