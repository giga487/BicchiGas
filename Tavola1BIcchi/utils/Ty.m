
function R = Ty(a,p)

    R = [cosd(a) 0 sind(a) p(1);
         0 1 0 p(2);
         -sind(a) 0 cosd(a) p(3);
         0 0 0 1];
end