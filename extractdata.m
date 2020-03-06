
% this script extracts data to use for figures
out={};
% specify value to extract
extr=[3,5]; % column 5 of data, the average, inside column 5, acidity
% specify data to load 
filenames={'20150518pH-results.mat','20150521pH-results.mat'};
% extraction
for i=1:length(filenames)
    load(filenames{i});
    for j=1:size(data,2)
        M=data{extr(1),j};
        N=M(:,extr(2));
        out{i,j,1}=data{1,j};
        out{i,j,2}=N(1);
        out{i,j,3}=N(end);
    end
end
q=size(out,1)*size(out,2);
a=reshape(out(:,:,1),[q,1]);
b=reshape(out(:,:,2),[q,1]);
c=reshape(out(:,:,3),[q,1]);
result=[a,b,c];