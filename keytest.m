function output = keytest
global key
global rel
rel='0';
key='1';
figure(1)
infig=gcf;
%set(infig,'Position',[-100,-100,0,0])
drawnow
%set(infig,'Visible','off')
set(infig,'WindowKeyPressFcn',@myfun);
set(infig,'WindowKeyReleaseFcn',@myfun2);
if(strcmp (key , 'uparrow'))
    output=1;
elseif (strcmp (key , 'downarrow'))
    output=-1;
else
    output=0;
end


end

function myfun(src,evn)
global key
key=evn.Key;
end
function myfun2(src,evn)
global rel
rel=evn.Key;
end