
delta = liebracket(f, g, q, 4);

% if rank(delta) = 4 the system is small time local accessible (Chow's
% theorem).
rank(delta)

%% Stampa matrice di controllabilita' su file
fid = fopen('delta.txt', 'wt');
[r,c] = size(delta);

fprintf(fid,'delta = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',delta(i,j));
            continue
        end
        fprintf(fid,'%s,',delta(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);

%% The system is small time local accessible
% from accessibility to controllability, dot 3
% if f(q0) = 0 the system is also small time local controllable.
% matlabFunction(f,'File','f_fun');
l = 0.2; %m
gravity = 9.81; %m/s^2
r = 0.02; %m
m1 = 0.088338025; %kg
m2 = 0.022245336; %kg
M = 0.548069759; %kg

b1 = 0.1;
b2 = 0.1;

B = m1 + m2/3;
C = m1 + m2 + M;
D = 2/5 * m1 * r^2;

q0 = [0,0,0,0]';
f0 = f_fun(B,C,D,b1,b2,gravity,l,q0)
