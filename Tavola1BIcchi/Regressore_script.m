%% regressore

clear
load('wk_S_regressore.mat');

%%

T1 = 0.5*parameter(1,2)*


%% 
fid = fopen('Y.txt', 'wt');
[r,c] = size(C);

fprintf(fid,'Y = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',C(i,j));
            continue
        end
        fprintf(fid,'%s,',C(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);