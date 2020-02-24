
function R = Tx(a,p)

    R = [ 1 0 0 p(1);
         0 cosd(a) sind(a) p(2);
         0 sind(a) cosd(a) p(3);
         0 0 0 1];
end