%% Controllore PD+G
initPD_traj;

[r,c] = size(ans.tau.signals.values);
tau_PDtraj = zeros(r,c);
tau_PDtraj = ans.tau.signals.values;
t_PDtraj = ans.t_sim.signals.values;

%% Conrollore Computed Torque
initCompTorque;

[r,c] = size(ans.tau.signals.values);
tau_CompTorque = zeros(r,c);
tau_CompTorque = ans.tau.signals.values;
t_CompTorque = ans.t_sim.signals.values;

%% Controllore Adaptive Computed Torque
initAdaptiveCompTorque;

[r,c] = size(ans.tau.signals.values);
tau_AdCompTorque = zeros(r,c);
tau_AdCompTorque = ans.tau.signals.values;
t_AdCompTorque = ans.t_sim.signals.values;

%% plot Tau comparison
figure   
for i = 1:6    
    subplot(2,3,i)

    plot(t_PDtraj,tau_PDtraj(:,i));
%    leg{1} = sprintf('Tau_{PD}');
    hold on;

    plot(t_CompTorque,tau_CompTorque(:,i));
%    leg{2} = sprintf('Tau_{CompTorque}');
    hold on;

    plot(t_AdCompTorque,tau_AdCompTorque(:,i));
%    leg{3} = sprintf('Tau_{AdCompTorque}');

    hold on;
%    legend(leg);
    ylabel('tau [Nm]');
    xlabel('time [s]');
    title(sprintf('tau_%d Comparison',i),'Interpreter','none');
    hold off;
    grid on;
end
leg{1} = sprintf('Tau_{PD}');
leg{2} = sprintf('Tau_{CompTorque}');
leg{3} = sprintf('Tau_{AdCompTorque}');
legend(leg);
