
% q = [theta dtheta x dx]

t = out.StatusOutput.Time;
data = out.StatusOutput.Data;
theta = data(:,1);
dtheta = data(:,2);
x = data(:,3);
dx = data(:,4);


figure;
subplot(2,2,1)
plot(t, theta);
title("Theta")
subplot(2,2,2)
plot(t, dtheta);
title("dTheta")
subplot(2,2,3);
plot(t, x);
title("X")
subplot(2,2,4)
plot(t, dx);
title("dX")







