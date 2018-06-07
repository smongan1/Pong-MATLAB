figure(99)
infig=gcf;
while 1
    figure(99)
    infig=gcf;
    drawnow
    key = get(infig,'CurrentKey');
    if(strcmp (key , 'uparrow'))
        output=1;
    elseif (strcmp (key , 'downarrow'))
        output=-1;
    else
        output=0;
    end
end
