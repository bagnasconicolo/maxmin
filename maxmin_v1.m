format compact
arrdati=csvread('data.csv');

[maxpeakValues, maxindexes] = findpeaks(arrdati(:,2));
maxValues = arrdati(maxindexes);
maxarr=[maxpeakValues, maxValues]


[minpeakValues, minindexes] = findpeaks(-arrdati(:,2));
minValues = arrdati(minindexes);
minarr=[-minpeakValues, minValues]

hold on
scatter(arrdati(:,1),arrdati(:,2),'r.','LineWidth',2)
scatter(minarr(:,2),minarr(:,1),'bx','LineWidth',2)
scatter(maxarr(:,2),maxarr(:,1),'gx','LineWidth',2)

p = polyfit(minarr(:,2),minarr(:,1),2)
p2 = polyfit(maxarr(:,2),maxarr(:,1),2)

x=linspace(0,4000,5000);

y1 = polyval(p,x);
y2 = polyval(p2,x);


plot(x,y2,'g')
plot(x,y1,'b')
