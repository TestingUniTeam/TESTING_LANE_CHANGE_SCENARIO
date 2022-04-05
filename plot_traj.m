 %% PLOT EGO-VEHICLE
x=simout.signals.values(:,1);
y=simout.signals.values(:,2);
% xx_rif=simout1.signals.values(:,1);
% yy_rif=simout1.signals.values(:,2);
plot(x,y)
hold all
plot(xx_rif,yy_rif)
legend('traiettoria generata','traiettoria riferimento');

 %% PLOT C4
x_C4=simout_C4.signals.values(:,1);
y_C4=simout_C4.signals.values(:,2);
% xx_rif=simout1.signals.values(:,1);
% yy_rif=simout1.signals.values(:,2);
plot(x_C4,y_C4)
hold all
plot(xx_rif_C4,yy_rif_C4)
legend('traiettoria generata','traiettoria riferimento');

%% PLOT C5
x_C5=simout_C5.signals.values(:,1);
y_C5=simout_C5.signals.values(:,2);
% xx_rif=simout1.signals.values(:,1);
% yy_rif=simout1.signals.values(:,2);
plot(x_C5,y_C5)
hold all
plot(xx_rif_C5,yy_rif_C5)
legend('traiettoria generata','traiettoria riferimento');

%% TOTAL PLOT ACCORDING TO THE SPACE
x=simout.signals.values(:,1);
y=simout.signals.values(:,2);
x_C4=simout_C4.signals.values(:,1);
y_C4=simout_C4.signals.values(:,2);
x_C5=simout_C5.signals.values(:,1);
y_C5=simout_C5.signals.values(:,2);
x_C7=simout_C7.signals.values(:,1);
y_C7=simout_C7.signals.values(:,2);


plot(x,y,'-r','LineWidth',1);
hold all
plot(x_C5,y_C5,'-b', 'LineWidth',1);
hold all
plot(x_C4,y_C4,'-g', 'LineWidth',1);
hold all
plot(x_C7,y_C7,'-y', 'LineWidth',1);

hold all
legend('traiettoria ego veichle' , 'traiettoroa C5', 'traiettoria C4', 'traiettoria C7'); 

%% TOTAL PLOT ACCORDING TO TIME
t = 0:Tc:T;
x=simout.signals.values(:,1);
y=simout.signals.values(:,2);
x_C4=simout_C4.signals.values(:,1);
y_C4=simout_C4.signals.values(:,2);
x_C5=simout_C5.signals.values(:,1);
y_C5=simout_C5.signals.values(:,2);
x_C7=simout_C7.signals.values(:,1);
y_C7=simout_C7.signals.values(:,2);


plot(t,y,'-r','LineWidth',1);
hold all
plot(t,y_C5,'-b', 'LineWidth',1);
hold all
plot(t,y_C4,'-g', 'LineWidth',1);
hold all
plot(t,y_C7,'-y', 'LineWidth',1);
hold all
legend('traiettoria ego veichle' , 'traiettoroa C5', 'traiettoria C4', 'traiettoria C7'); 