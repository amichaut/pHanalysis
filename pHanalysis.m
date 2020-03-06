
% this cover script processes the data
% it creates a scatter plot for segmentations, a binned average
% and an exponential fit to the binned average, output a,b from the fit and
% calculate a difference betwee ratios between posterior and anterior

% close previous figures
close all;

% input: data file name
filename='20150427pH';
filetype='.xlsx';

% process data from excel raw data
data=processdata([filename,filetype]);

% specify: 
    % filtering parameters
ch=2; %e.g. use ch1-tomato to remove dim meshes/wrongly placed meshes
threshold=100; %intensity threshold for meshes underwhich to remove
    % binning parameters
binalong=1; % bin along PA axis
frequency=40; % bin every forty meshes
    % fitting parameters
fitx=1; % use PA position to fit, column 1 in data
fity=5; % use ch2/ch3, i.e. 488/405 to fit, column 5 in data
    % caculating ratio differences between different positions after
    % fitting, in microns
pos1=0; % posterior end
pos2=1500; % an anterior location
parameters=[ch,threshold,binalong,frequency,fitx,fity,pos1,pos2];
% save parameters used for each time of data analysis
    % figure labels and axis limits
xmax=1600;
ymax=3;
fxlabel='P-A Distance (\mum)';
fylabel='Intensity Ratio 488/405';

% plotting data

for i=1:size(data,2)
    figure;
    data1=data{2,i};
    data1=filterdata(ch,threshold,data1);
    data1b=bindata(binalong,frequency,data1);
    diff=ratiodiff(pos1,pos2,data1b,fitx,fity);
    data{3,i}=data1b; %save data
    data{4,i}=diff; %save data
    plot(data1(:,fitx),data1(:,fity),'o','color','b');
    hold on; plot(data1b(:,fitx),data1b(:,fity),'o','MarkerFaceColor','r');
    % figure decoration
    title([filename,'-',data{1,i},'(diff=',num2str(diff(1)),')']);
    xlim([0,xmax]);ylim([0,ymax]);
    xlabel(fxlabel,'FontSize',12);
    ylabel(fylabel,'FontSize',12);
end    

% save figures
figHandles = findobj('Type','figure');
for hhh=1:length(figHandles)
    saveas(figHandles(hhh),[filename,'-',data{1,size(data,2)-hhh+1}],'jpg');
end

% normalize data and bin data again
data=normalize(data);
for i=1:size(data,2)
    data2=data{6,i};
    data2b=bindata(binalong,frequency,data2);
    data{7,i}=data2b; %save data
end

% save data for figure plotting
save([filename,'-results.mat'],'data','parameters');

