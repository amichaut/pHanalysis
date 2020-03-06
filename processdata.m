
function out=processdata(filename)
% e.g. filename='20150513pH.xlsx';% specify import data

% this script completes the computation on a raw segmentation table
% Input: xlsx files containing GoFigure output table
% Output: matrix (n,6) with first column being the PA position (most P being
% 0),second colum being intensity ch1, third ch2, fourth ch3, fifth
% ch2/ch3, sixth ch3/ch2

[status,sheets] = xlsfinfo(filename); % read sample names
pixelsize=3; % pixel size in XY in microns
indpos=[9,10,11,12,13,14]; % positions of meshes
indchs=[21,22,23]; % channels of intensities

% Separate landmark meshes and compute the AP axis
indsep=17;criteria=0;

% specify output
out=cell(2,size(sheets,2));

for i=1:size(sheets,2)

out{1,i}=sheets{i};

% clean, compute and reorganize the table
raw = xlsread(filename,sheets{i}); % read raw data per sample
P = raw(raw(:,indsep)==criteria,indpos); % marker mesh positions
index=raw(:,indsep)~=criteria;
M = zeros(sum(index),6);
M(:,1)=paposition(P,raw(index,indpos))*pixelsize;% compute the PA axis straight line in XY
M(:,2:4)=raw(index,indchs);
M(:,5)=M(:,3)./M(:,4);
M(:,6)=1./M(:,5);

out{2,i}=M;

end

end