
dh = jacobian(h, q);

Lfh = jacobian(h, q)*f;
dLfh = jacobian(Lfh, q);

Lgh = jacobian(h, q)*g;
dLgh = jacobian(Lgh, q);

LfLfh = jacobian(Lfh, q)*f;
dLfLfh = jacobian(LfLfh, q);

LfLgh = jacobian(Lgh, q)*f;
dLfLgh = jacobian(LfLgh, q);

LgLfh = jacobian(Lfh, q)*g;
dLgLfh = jacobian(LgLfh, q);

% se rank(delta) = 4 il sistema è localmente osservabile (Theorem 7).
dO = [dh; dLfh; dLgh; dLfLfh; dLfLgh; dLgLfh];
rank(dO)

%% Stampa matrice di osservabilita' su file
fid = fopen('dO.txt', 'wt');
[r,c] = size(dO);

fprintf(fid,'delta = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',dO(i,j));
            continue
        end
        fprintf(fid,'%s,',dO(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);
