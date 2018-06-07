function blvel=speedcheck(blvel,mxblsp)
r=sqrt(sum(blvel.^2));
r2=sqrt(sum(mxblsp.^2));
if r>r2
    ang=asin(blvel(1)/r);
    r=r2;
    blvel=r*[sin(ang),cos(ang)];
end
end

