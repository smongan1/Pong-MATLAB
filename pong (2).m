clear all
close all
ballposinit=[0.5,0.5];
ballvelinit=[(rand+.75)/2,(rand+.75)/2];

quit=0;
fps=30;
cps=60;
res=[800,600];
dim=[4,3];
barsize=[0.03,0.25];
maxballspeed=2;
basecompspeed=0.025;
ballhitspeed=0.1;

SS=get(0,'ScreenSize');
rat=res./dim;
ballhitspeed=ballhitspeed*rat(1);
barsize=rat.*barsize;
goal=res(1)/8-barsize(1);
ballsize=4*10/800*rat;
blvel=rat.*ballvelinit;
blpos=ballposinit.*res;
plypsinit=[res(1)/8,res(2)/2];
playpos=plypsinit;
cmppos=[res(1)-plypsinit(1),plypsinit(2)];
cmove=basecompspeed*res(2)/dim(2);
hitps={ballhitspeed,barsize,ballsize};
mxblsp=maxballspeed*rat;
score=[0,0];
timer2=cputime;
istimed=1;
figure(1)
clf
set(1,'Position',SS)
while(~quit)
    tic;
    if ~istimed
        timer2=cputime;
        istimed=1;
    end
    blpos=blpos+blvel*1/fps;
    cmpparams=[cmppos(2),cmove];
    [playpos(2),cmppos(2)]=playermove(playpos(2),cmpparams,blpos);
    [playpos,cmppos]=barcheck(playpos,cmppos,barsize,res);
    [blpos,blvel]=boundcheck(blpos,blvel,res,ballsize);
    
    %checks if player hits the ball
    ishit=0;
    [blpos,blvel,ishit]=ballhitcheck(blpos,blvel,hitps,playpos,ishit);
    %checks if cmp hits the ball
    [blpos,blvel,ishit]=ballhitcheck(blpos,blvel,hitps,cmppos,ishit);
    if res(1)-blpos(1)<goal || blpos(1)<goal
        score=score+abs([-1,1]+sign(goal-blpos(1)))/2;
        blpos=ballposinit.*res;
        blvel=rat.*ballvelinit;
        drawparams={blpos,barsize,playpos,cmppos,res,ballsize,score};
        drawpong(drawparams)
        pause(3)
        if max(score)>=10
            quit=1;
        end
    end
    blvel=speedcheck(blvel,mxblsp);
    drawparams={blpos,barsize,playpos,cmppos,res,ballsize,score};
    timer3=cputime;
    if (timer3-timer2)>1/fps
        drawpong(drawparams)
        istimed=0;
    end
    timer=toc;
    while(timer<1/cps)
        timer=toc;
        
    end
    
end