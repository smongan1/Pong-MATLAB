function [playpos,cmppos] = playermove(pl,cm,blpos)
playpos=pl;
cmppos=cm(1);
cmove=cm(2);

cmpdir=2*(((cmppos-blpos(2))<0)-0.5);
pps=get(0,'PointerLocation');
playpos=pps(2)-140;
cmppos=cmppos+cmpdir*cmove;

end

