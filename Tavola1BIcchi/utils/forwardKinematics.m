function [Pcom, Etip, T00, T01, T12, T23, T34, T45, T56] = forwardKinematics(param, q)

    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);
    theta4 = q(4);
    theta5 = q(5);
    theta6 = q(6);
    
    d1 = param(1,1);
    d2 = param(2,1);
%     d3 = param(3,1);
	d4 = param(4,1);
    d5 = param(5,1);
    d6 = param(6,1);
    
    alpha1 = param(1,3);
    alpha2 = param(2,3);
    alpha3 = param(3,3);
    alpha4 = param(4,3);
    alpha5 = param(5,3);
    alpha6 = param(6,3);

    % The Stanford manipulator is composed of a spherical arm and a spherical wrist
    % link  a_i     aplha_i     d_i     theta_i
    % 1     0       -pi/2       0       theta1
    % 2     0       pi/2        d2      theta2
    % 3     0       0           d3      0
    % 4     0       -pi/2       0       theta4
    % 5     0       pi/2        0       theta5
    % 6     0       0           d6      theta6
    
    T00 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T01 = getTransformMatrix(theta1, d1, 0, alpha1);
    T12 = getTransformMatrix(theta2, d2, 0, alpha2);
    T23 = getTransformMatrix(0, d3, 0, alpha3); %� una lunghezza la variabile
    T34 = getTransformMatrix(theta4, d4, 0, alpha4);
    T45 = getTransformMatrix(theta5, d5, 0, alpha5);
    T56 = getTransformMatrix(theta6, d6, 0, alpha6);

    Etip = T00 * T01 * T12 * T23 * T34 * T45 * T56;
    
    T01c = getTransformMatrix(theta1, d1/2, 0, alpha1);
    T12c = getTransformMatrix(theta2, d2/2, 0, alpha2);
    T23c = getTransformMatrix(0, d3/2, 0, alpha3);
    T34c = getTransformMatrix(theta4, d4/2, 0, alpha4);
    T45c = getTransformMatrix(theta5, d5/2, 0, alpha5);
    T56c = getTransformMatrix(theta6, d6/2, 0, alpha6);

    c1 = T01c(1:3, 4);
    temp = T01*T12c; 
    c2 = temp(1:3, 4);
    temp = T01*T12*T23c; 
    c3 = temp(1:3, 4);
    temp = T01*T12*T23*T34c;
    c4 = temp(1:3, 4);
    temp = T01*T12*T23*T34*T45c;
    c5 = temp(1:3, 4);
    temp = T01*T12*T23*T34*T45*T56c;
    c6 = temp(1:3, 4);
    
    Pcom = (d1*c1 + d2*c2 + d3*c3 + d4*c4 + d5*c5 + d6*c6) / (sum(param(:,2)));

end