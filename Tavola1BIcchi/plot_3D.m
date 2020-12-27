
function x = plot_3D(parameter,q)

    a = parameter(1:6,1);
    m = parameter(1:6,2);

    x = [];
    [Pcom, Etip, T00, T01, T12, T23, T34, T45, T56] = forwardKinematics(parameter, q);
    
    A1 = T00*T01;
    A2 = A1*T12;
    A3 = A2*T23;
    A4 = A3*T34;
    A5 = A4*T45;
    
    x(:,end+1) = T00(1:3,4);
    x(:,end+1) = A1(1:3,4);
    x(:,end+1) = A2(1:3,4);
    x(:,end+1) = A3(1:3,4);
    x(:,end+1) = A4(1:3,4);
    x(:,end+1) = A5(1:3,4);
    x(:,end+1) = Etip(1:3,4);

    figure
    hold on;
    plot3(x(1,1),x(2,1),x(3,1),'bo');
    
    for i = 1:size(x,2)-1
        line(x(1,i:i+1),x(2,i:i+1),x(3,i:i+1));
        plot3(x(1,i+1),x(2,i+1),x(3,i+1),'ro');
    end
    
    plot3(x(1,end),x(2,end),x(3,end),'go');
%     plot3(x(1,3),x(2,3),x(3,3),'yo');
%     plot3(x(1,1:end-1),x(2,1:end-1),x(3,1:end-1));
%     plot3(x(1,end-1:end),x(2,end-1:end),x(3,end-1:end),'-o','Color','b');
    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;
    hold off;
    
end
