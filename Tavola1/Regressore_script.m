%% Regressore

load('B_matrix.mat')
load('C_matrix.mat')
load('G_matrix.mat')

%%

% I = sym('I', [6 1], 'real');
% tau = sym('Y', [6,6]);
% g0 = sym('g0',1,'real');
Y_t = sym('Y', [6,2]);
tau = simplify(B*ddq + C*dq + G);

% pi_vec = sym('pi',[2,1],'real');
Pi = [m(6); 1];

%%
for i = 1:6
   
    [c,t] = coeffs(tau(i), Pi(1), 'all');
    Y_t(i,:) = c;    

    result(i) = simplify(tau(i) - Y_t(i,:)*t');
end

%%
% fid = fopen('Y.txt', 'wt');
% [r,c] = size(Y_t);
% 
% fprintf(fid,'Y = [');
% for i = 1:r
%     for j = 1:c
%         if(j == c)           
%             fprintf(fid,'%s;\n',Y_t(i,j));
%             continue
%         end
%         fprintf(fid,'%s,',Y_t(i,j));
%     end
% end
% fprintf(fid,'];');
% fclose(fid);

matlabFunction(Y_t,'File','Y_fun_bis');

%% test sulla correttezza

% res = simplify(Y - Y_t*[m(6),1]');
tau_reg = simplify(Y_t * Pi);
res = simplify(tau - tau_reg);

% Y_r = Regressore_m6(q,dq,ddq,parameter,g0);
