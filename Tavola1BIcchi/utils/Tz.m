
function R = Tz(a,p)

    R = [cosd(a) -sind(a) 0 p(1);
         sind(a) cosd(a) 0 p(2);
         0 0 1 p(3);
         0 0 0 1];
end