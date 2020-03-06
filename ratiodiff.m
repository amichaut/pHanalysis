

function out=ratiodiff(pos1,pos2,data,fitx,fity)
% pH difference analysis, this script takes in output from processing and
% fit an exponential model to the data to obtain the pH gradient. The
% difference is calculated between two A-P positions. Posterior end is 0.
% Units in microns.
x=data(:,fitx);y=data(:,fity);
f=fit(x,y,'exp1');
factor=f.b;
diff=exp((pos2-pos1)*factor);
out=[diff,f.a,f.b];

end