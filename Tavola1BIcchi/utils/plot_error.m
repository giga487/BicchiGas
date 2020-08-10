
function plot_error(data_sim, sim_string)

    t_sim = data_sim.t_sim.signals.values;
%     q_sim = data_sim.q_CompTorque.signals.values;
    
    [r,c] = size(data_sim.tau.signals.values);
    
    %% Tau
    title_string = sprintf("%s: Tau", sim_string );
    figure
    for i = 1:c        

        plot(t_sim,data_sim.tau.signals.values(:,i));
        leg{i} = sprintf('Tau_%d', i);
        hold on;

    end
    legend(leg);    
    ylabel('tau [Nm]');
    xlabel('time [s]');
    title(title_string);
    hold off;
    grid on;

    %% Error q
    title_string = sprintf("%s: Error q", sim_string );
    figure
    for i = 1:c        

        plot(t_sim,data_sim.e_joint.signals.values(:,i));
        leg{i} = sprintf('e_%d', i);
        hold on;

    end
    legend(leg);
    ylabel('e [rad]');
    xlabel('time [s]');
    title(title_string);
    hold off;
    grid on;
    
    %% Error x
    title_string = sprintf("%s: Error x", sim_string );
    figure
    for i = 1:3 %x y z        

        plot(t_sim,data_sim.e_x.signals.values(:,i));
        leg{i} = sprintf('e_x_%d', i);
        hold on;

    end
    ylabel('e operative space [m]');
    xlabel('time [s]');
    legend(leg);
    title(title_string);
    hold off;
    grid on;
   

end