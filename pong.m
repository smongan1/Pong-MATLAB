clear all
figure(1)
clf
ballposinit=[0.5,0.5];
ballvelinit=[rand/2,rand-.5];
quit=0;
fps=30;
cps=60;
res=[800,600];
dim=[4,3];
barsize=[0.03,0.25];
playermovespeed=0.2;
maxballspeed=5;
basecompspeed=500/cps;
ballhitspeed=0.1;
soundfile='ba.mp3';
% samples=10000000;
% sr=1000;
% x=1:samples;
% ballsound=sin(x*6*pi/(samples));
% sound(ballsound,sr)

[smat,srate]=audioread(soundfile);
songlength=length(smat)/srate;
rat=res./dim;
ballhitspeed=ballhitspeed*rat(1);
pmove=playermovespeed*rat(2);
barsize=rat.*barsize;
goal=res(1)/8-barsize(1);
ballsize=4*10/800*rat;
blvel=rat.*ballvelinit;
blpos=ballposinit.*res;
plypsinit=[res(1)/8,res(2)/2];
playpos=plypsinit;
cmppos=[res(1)-plypsinit(1),plypsinit(2)];
cmove=basecompspeed;
hitps={ballhitspeed,barsize,ballsize};
mxblsp=maxballspeed*rat;
score=[0,0];
timer2=cputime;
stimer=clock;
stimer=stimer(6)+stimer(5)*60+stimer(4)*3600;
sound(smat,srate)
istimed=1;
SS=get(0,'ScreenSize');
figure(1)
set(gcf,'Position',SS)
color = get(gca,'Color');
set(gca,'XColor',color,'YColor',color,'TickDir','out')
while(~quit)
    tic;
    if ~istimed
        timer2=cputime;
        istimed=1;
    end
    blpos=blpos+blvel*1/fps;
    plparams=[playpos(2),pmove];cmpparams=[cmppos(2),cmove];
    [playpos(2),cmppos(2)]=playermove(plparams,cmpparams,blpos);
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
    stimer2=clock;
    stimer2=stimer2(6)+stimer2(5)*60+stimer2(4)*3600;
    if (stimer2-stimer)>songlength
        clear sound
        sound(smat,srate)
        stimer=clock;
        stimer=stimer(6)+stimer(5)*60+stimer(4)*3600;
    end
    timer=toc;
    while(timer<1/cps)
        timer=toc;
    end
    
end