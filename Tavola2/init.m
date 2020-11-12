

% Carro ponte, non chiedetemi perchè
clear
clc

syms L J  m_r m_p m_c theta phi
q = sym('q_%d',[2,1]);

m_prova = [1,2,3]';
B_11 = @(m_r, m_p, m_c)(m_r + m_p + m_c);
B_12 = 0;
B_13 = @(m_p,L,theta,phi)(m_p*L*cos(theta)*sin(phi)); 
B_14 = @(m_p,L,theta,phi)(m_p*L*sin(theta)*cos(phi));

B_21 = 0;
B_22 = @(m_p,m_c)(m_p + m_c);
B_23 = @(m_p,L,theta,phi)(m_p*L*cos(theta)*cos(phi)); 
B_24 = @(m_p,L,theta,phi)(-(m_p*L*sin(theta)*sin(phi))); 

B_31 = B_13;
B_32 = B_23;
B_33 = @(m_p, L, J)(m_p*L^2+J);
B_34 = 0;

B_41 = B_14;
B_42 = B_24;
B_43 = 0;
B_44 = @(m_p,L,theta,phi)(m_p*L^2);

% B@(m_p,m_c,m_r,L,J,theta,phi)([B_11, B_12, B_13, B_14]);
B = {B_11,B_12,B_13,B_14;
     B_21,B_22,B_23,B_24;
     B_31,B_32,B_33,B_34;
     B_41,B_42,B_34,B_44};
 
 
B_data = @(m_r,m_p,m_c,L,J,phi,theta)([B{1,1}(m_r,m_p,m_c)    , B{1,2}()               , B{1,3}(m_p,L,theta,phi), B{1,4}(m_p,L,theta,phi);
                                       B{2,1}()               , B{2,2}(m_p,m_c)        , B{2,3}(m_p,L,theta,phi), B{2,4}(m_p,L,theta,phi);
                                       B{3,1}(m_p,L,theta,phi), B{3,2}(m_p,L,theta,phi), B{3,3}(m_p, L, J)      , B{3,4}();
                                       B{4,1}(m_p,L,theta,phi), B{4,2}(m_p,L,theta,phi), B{4,3}()               , B{4,4}(m_p,L,theta,phi)]);


m_r = 1;
m_p = 2;
m_c = 5;
L = 10;
J = 100;
phi = 0;
theta = 2;

B_now = B_data(m_r,m_p,m_c,L,J,phi,theta);


 