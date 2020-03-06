
function out=filterdata(ch,threshold,data)

% this function removes for example dim segmentations that could contain a
% lot of noise, using an indicator of ch and threshold of intensity

% input is the processed data matrix, output is the same format

ind=data(:,ch)>=threshold;
out=data(ind,:);

end