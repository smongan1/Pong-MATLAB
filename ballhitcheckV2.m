function [ blpos,blvel,ishit ] = ballhitcheck(blpos,blvel,hs,playpos,ishit)
%hitps={ballhitspeed,barsize,ballsize};
if ~ishit
bhs=hs{1};barsize=hs{2};ballsize=hs{3};
rr=blpos-playpos;
xdir=sign(rr(1));
tst1=abs(rr(1))<barsize(1)+ballsize(1);
tst2=abs(rr(2))<barsize(2)+ballsize(2);
if (tst1 && tst2)
    mag=abs(norm(blvel));
    ang=asin(blvel(1)/mag)-acos((-playpos(2)+blpos(2))/(barsize(2)+ballsize(2)))/4;
    blvel=mag*[sin(ang),cos(ang)];
    blvel(1)=-blvel(1)+xdir*bhs;
    blpos(1)=playpos(1)+xdir*(barsize(1)+ballsize(1));
    ishit=1;
else
    ishit=0;
end
end
end

