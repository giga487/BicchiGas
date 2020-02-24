
function plot_3D(parameter,q)

    a = parameter(1:6,1);
    m = parameter(1:6,2);

    A01 = matrixDH(0,-sym(pi)/2,0,q(1));
    A12 = matrixDH(0,sym(pi)/2,a(2),q(2));
    A23 = matrixDH(0,0,a(3),0);
    A34 = matrixDH(0,-sym(pi)/2,0,q(4));
    A45 = matrixDH(0,sym(pi)/2,0,q(5));
    A56 = matrixDH(0,0,a(6),q(6));
    AT = A01*A12*A23*A34*A45*A56;
    
    
    x1 = A01(1:3,4);
    A_t = A01*A12;
    x2 = A_t(1:3,4);
    A_t = A01*A12*A23;
    x3 = A_t(1:3,4);
    A_t = A01*A12*A23*A34;
    x4 = A_t(1:3,4);
    A_t = A01*A12*A23*A34*A45;
    x5 = A_t(1:3,4);
    x6 = AT(1:3,4);
    
    hold on;
    plot3(x1(1),x1(2),x1(3));
    plot3(x2(1),x2(2),x2(3));
    plot3(x3(1),x3(2),x3(3));
    hold off;
    grid on;

end
