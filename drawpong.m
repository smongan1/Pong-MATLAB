function drawpong(drpa)
%drawparams={blpos,barsize,playpos,cmppos,res,ballsize};
blpos=drpa{1};barsize=drpa{2};playpos=drpa{3};
cmppos=drpa{4};res=drpa{5};ballsize=drpa{6};
score=drpa{7};
figure(1)
plot(blpos(1),blpos(2),'o','MarkerSize',ballsize(1))
hold on
str=sprintf('%i - %i',score(1),score(2));
text(res(1)/2-res(1)/16,res(2)-res(2)/12,str,'Color','k','fontsize',24)
pxlims=[playpos(1)-barsize(1),playpos(1)+barsize(1),playpos(1)+barsize(1),playpos(1)-barsize(1)];
pylims=[playpos(2)-barsize(2),playpos(2)-barsize(2),playpos(2)+barsize(2),playpos(2)+barsize(2)];
patch(pxlims,pylims,'k')
cxlims=[cmppos(1)-barsize(1),cmppos(1)+barsize(1),cmppos(1)+barsize(1),cmppos(1)-barsize(1)];
cylims=[cmppos(2)-barsize(2),cmppos(2)-barsize(2),cmppos(2)+barsize(2),cmppos(2)+barsize(2)];
patch(cxlims,cylims,'k')
hold off
axis([1,res(1),1,res(2)])
color = get(gca,'Color');
set(gca,'XColor',color,'YColor',color,'TickDir','out')
drawnow

end