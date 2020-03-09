
function plot_3D(parameter,q)

    a = parameter(1:6,1);
    m = parameter(1:6,2);

    A00 = [Rx_rad(sym(pi/2)),[0,0,0]';0,0,0,1];
    A01 = matrixDH(0,-sym(pi/2),a(1),q(1));
    A12 = matrixDH(0,sym(pi/2),a(2),q(2));
    A23 = matrixDH(0,0,q(3),0);
    A34 = matrixDH(0,-sym(pi/2),a(4),q(4));
    A45 = matrixDH(0,sym(pi/2),a(5),q(5));
    A56 = matrixDH(0,0,a(6),q(6));
    
    x = [0,0,0]';
    A_t = A01;
    x(:,end+1) = A_t(1:3,4);
    A_t = A01*A12;
    x(:,end+1) = A_t(1:3,4);
    A_t = A01*A12*A23;
    x(:,end+1) = A_t(1:3,4);
    A_t =  A01*A12*A23*A34;
    x(:,end+1) = A_t(1:3,4);
    A_t = A01*A12*A23*A34*A45;
    x(:,end+1) = A_t(1:3,4);
    A_t =  A01*A12*A23*A34*A45*A56;
    x(:,end+1) = A_t(1:3,4);
    
    
    plot3(x(1,:),x(2,:),x(3,:),'-o');
    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;
    
end
