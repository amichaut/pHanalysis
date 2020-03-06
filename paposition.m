function out=paposition(P,M)

% obtain the PA axis as a straight line connecting posterior and anterior
% marks
% the two close meshes indicate Posterior, caculae distances every other
% pair to obtain the posterior and anterior meshes

X=(P(:,1)+P(:,4))/2;
Y=(P(:,2)+P(:,5))/2;
o=(X(1)-X(2))^2+(Y(1)-Y(2))^2;
p=(X(2)-X(3))^2+(Y(2)-Y(3))^2;
q=(X(1)-X(3))^2+(Y(1)-Y(3))^2;
dis=min(o,min(p,q));
index=[dis==o;dis==p;dis==q];
select=[1,2;2,3;1,3];xx=select(index,:);
post=[(X(xx(1))+X(xx(2)))/2,(Y(xx(1))+Y(xx(2)))/2];
yy=setdiff([1,2,3],xx);
ante=[X(yy),Y(yy)];

% obtain pa distances of all cells
pa=ante-post;
PC=[(M(:,1)+M(:,4))/2-post(1),(M(:,2)+M(:,5))/2-post(2)];
out=zeros(size(PC,1),1);
for i=1:size(PC,1)
    out(i)=dot(PC(i,:),pa/norm(pa));
end
out=out+(1-abs(min(out))/min(out))/2*abs(min(out)); % remove negative values

end