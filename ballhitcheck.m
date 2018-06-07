function [ blpos,blvel,ishit ] = ballhitcheck(blpos,blvel,hs,playpos,ishit)
%hitps={ballhitspeed,barsize,ballsize};
if ~ishit
bhs=hs{1};barsize=hs{2};ballsize=hs{3};
rr=blpos-playpos;
xdir=sign(rr(1));
ydir=sign(blvel(2));
tst1=abs(rr(1))<barsize(1)+ballsize(1);
tst2=abs(rr(2))<barsize(2)+ballsize(2);
if (tst1 && tst2)
    blvel=[-blvel(1),blvel(2)]+[rand*xdir,ydir*(rand-0.25)*2]*bhs/2;
    blpos(1)=playpos(1)+xdir*(barsize(1)+ballsize(1));
    ishit=1;
else
    ishit=0;
end
end
end

