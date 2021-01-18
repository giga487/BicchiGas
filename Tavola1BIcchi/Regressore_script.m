%% regressore

clear
clc
load('wk_S_regressore.mat');

%%

I = sym('I', [6 1], 'real');
Y = sym('Y', [6,6]);
g0 = sym('g0',1,'real');
Y_t = sym('Y', [6,2]);
Y = B*ddq + C*dq + G;

pi_vec = sym('pi',[2,1],'real');
pi_vec = [m(6)];
%% 
% for i = 1:1:6
%     
%     [c1,t1] = coeffs(Y(i), pi_1);
%     C1 = arrayfun(@char,t1,'Un',0);
%     C1 = c1(~cellfun('isempty',regexp(C1,'\w*m_b\w*','match')));
%     
%     if isempty(C1)
%         C1 = 0;
%     end
% 
%     Y_t(i,1) = c1(1);    
%     
%     [c2,t2] = coeffs(Y(i), pi_2);
%     C2 = arrayfun(@char,t2,'Un',0);
%     C2 = c2(~cellfun('isempty',regexp(C2,'\w*m_c\w*','match')));
% 
%     if isempty(C2)
%         C2 = 0;
%     end
%     Y_t(i,2) = c2(1);
%     
%     %Calcolo 3
%     [c3,t3] = coeffs(Y(i), pi_3);
%     C3 = arrayfun(@char,t3,'Un',0);
%     C3 = c3(~cellfun('isempty',regexp(C3,'\w*mfb_rm\w*','match')));
%     
%     if isempty(C3)
%         C3 = 0;
%     end
%     Y_t(i,3) = c3(1);
%     
%     [c4,t4] = coeffs(Y(i), pi_4);
%     C4 = arrayfun(@char,t4,'Un',0);
%     C4 = c4(~cellfun('isempty',regexp(C4,'\w*m_n\w*','match')));
% 
%     if isempty(C4)
%         C4 = 0;
%     end
%     Y_t(i,4) = c4(1);
%     
%     [c5,t5] = coeffs(Y(i), pi_5);
%     C5 = arrayfun(@char,t5,'Un',0);
%     C5 = c5(~cellfun('isempty',regexp(C5,'\w*\^\w*m_p\w*','match')));
% 
%     if isempty(C5)
%         C5 = 0;
%     end
%     
%     Y_t(i,5) = c5(1);
% 
%     %---------------------------------------------------------------------
%     [c6,t6] = coeffs(Y(i), pi_6);
%     C6 = arrayfun(@char,t6,'Un',0);
%     C6 = c6(~cellfun('isempty',regexp(C6,'\w*F\w*','match')));
% 
%     if isempty(C6)
%         C6 = 0;
%     end
%     Y_t(i,6) = c6(1);
% 
% end
% 
% simplify(Y - Y_t*pi_vec)

for i = 1:6
   
    [c,t] = coeffs(Y(i), pi_vec(1),'all');
    
    %Begins with any number of alphanumeric or underscore characters, \w*.

    Y_t(i,:) = c;    

    result(i) = simplify(Y(i) - Y_t(i,:)*t')
end
%%

fid = fopen('Y.txt', 'wt');
[r,c] = size(Y_t);

fprintf(fid,'Y = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',Y_t(i,j));
            continue
        end
        fprintf(fid,'%s,',Y_t(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);

%% test sulla correttezza

simplify(Y - Y_t*[m(6),1]')


