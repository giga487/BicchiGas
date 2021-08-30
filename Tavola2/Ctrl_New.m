

% CTRL
clc
clear

load('DELTA_NEW.mat')

h1 = atan(tan(q(4))*sin(q(3)));
h2 = asin(sin(q(4))*cos(q(3)));
%% 
% Delta = dim span{g, [f, g]}

D1 = liebracket(f_,g_,q, 4);

%%

D1_f = @(x1,x2,x3,x4,x5,x6,x7,x8)(D1(x1,x2,x3,x4,x5,x6,x7,x8));
