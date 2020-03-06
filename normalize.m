
% this function normalizes data per sample in data
% returns the global average data in each data column (row=5)
% normalized data in the same format as row=2 in row=6

function out=normalize(data)


out=data;
for i=1:size(data,2)
data1=data{2,i};
out{5,i}=mean(data1,1);
data2=data1;
for j=1:size(data1,1)
    data2(j,:)=data1(j,:)./out{5,i};
end
out{6,i}=data2;
end

end