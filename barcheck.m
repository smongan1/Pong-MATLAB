function [ playpos,cmppos ] = barcheck(playpos,cmppos,barsize,res)
if playpos(2)>=res(2)-barsize(2)
    playpos(2)=res(2)-barsize(2);
elseif playpos(2)<=1+barsize(2)
    playpos(2)=1+barsize(2);
end

if cmppos(2)>=res(2)-barsize(2)
    cmppos(2)=res(2)-barsize(2);
elseif cmppos(2)<=1+barsize(2)
    cmppos(2)=1+barsize(2);
end

end

