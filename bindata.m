
function out=bindata(binalong,frequency,data)

% this function takes in a processed data and calculate a binned average
% binalong specifies which column to use as bin criteria
% frequency specifies how many meshes per bin
% output is in the same format as input data

outsize=floor(size(data,1)/frequency);
datas=sortrows(data,binalong);

out=zeros(outsize,size(data,2));
for i=1:outsize
    out(i,:)=sum(datas((1+(i-1)*frequency):i*frequency,:))/frequency;
end

end