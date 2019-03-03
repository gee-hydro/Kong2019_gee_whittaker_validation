clear, clc
close all
%%

file_y = 'TSM_CANS6_y.txt';
file_w = 'TSM_CANS6_w.txt';

y = importdata(file_y);
w = importdata(file_w);

n = length(y);

x    = (1:n);
xi   = x;

nf   = 3;
dm   = 7;
HiLo = 1;
thr  = 0.1;
fet  = 0.02;
high = 1.0;
low  = -0.1;
yi   = y';

[y_1, y_2, y_3, y_or]=MWHA(x,xi,nf,dm,HiLo,thr,fet,high,low,yi);

plot([yi, y_1, y_2, y_3, y_or])
legend({'yi', 'y-1', 'y-2', 'y-3', 'y-or'})

ys = table(yi, y_1, y_2, y_3);

%% HANTS
nptperyear = 23;
ylu = [low, high];
noutmax = 10/nptperyear*n;
delta = 0.1;

[yr, amp, phi] = HANTS(yi, x', HiLo, nf, ylu, nptperyear, fet, noutmax, delta);

close all
plot([yi, yr]);

% function [y_1,y_2,y_3,y_or]=MWHA(x,xi,nf,dm,HiLo,thr,fet,high,low,yi)

% xi  : ���нڵ�����
% x   : ����ֵ���˲����Ľڵ�����
% nf  : г��������Ĭ��ֵΪ1��
% dm  : ֧����뾶��Ĭ��ֵΪ7��
% HiLo: 'Hi','Lo','none'.
% thr : �жϵ�ֵ�����ֵ��NDVI��Ϊ0.1��
% fet : �����0.01��
% high: ����ֵ�����ֵ��NDVI=1��
% low : ����ֵ�����ֵ��NDVI=-1��
% yi  : ������ʱ�����У���������
