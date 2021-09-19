function T = I_f(m,L)
    % x destra, y sopra, z uscente
    
    Ixx_b = m*(L^2)/12;
    Iyy_b = m*(L^2)/12;
    Izz_b = m*(L^2)/12;

    T = [Ixx_b,0,0;
          0,Iyy_b,0;
          0,0,Izz_b;];

end