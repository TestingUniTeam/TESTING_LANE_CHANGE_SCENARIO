Tc = 0.1;                           %% sampling time
T = 40;                             %% simulation time
t = 0:Tc:T;

V0_ego = param_random(:,1);         %% initial speeds of ego-vehicle, C4, C5 and C7
V0_C4= param_random(:,2); 
V0_C5 = param_random(:,3);
V0_C7= param_random(:,4);

acc_C4_all = param_random(:,5);     %% deceleration values of C4 and C5
acc_C5_all = param_random(:,6);


for i = 1 : length(V0_ego)
    
    acc_C4 = acc_C4_all(i);
    acc_C5 = acc_C5_all(i);
    
    % EGO-VEHICLE PARAMETERS %
 
 X0 = [0 2];                                    %% initial position
 Angles0 = 0;                                   %% initial yaw angle
 V0_ego_init = V0_ego(i);                       %% initial speed
 init_sim=[X0 (V0_ego_init/3.6) Angles0]';     

 x_tr = [0 20 30 50 90 1000];        
 y_tr = [0 20 30 50 90 1000];
 
 xx_rif = 0:Tc:x_tr(end);


A = [100 X0(2)];                                  %% generating trajectory for lane change
B = [150 6];
[m,q] = retta2punti(A,B);

for it=1:length(xx_rif)
if xx_rif(it)>=0 & xx_rif(it)<= A(1)
    yy_rif(1,it)=X0(2);
elseif xx_rif(it)> A(1) & xx_rif(it)<= B(1)
    yy_rif(1,it) = q+(m*xx_rif(it));
else
    yy_rif(1,it)= B(2);
end
end

           % C5 PARAMETERS %


X0_C5 = [40 2];                                           
Angles0_C5 = 0;                  
V0_C5_init = V0_C5(i); 
init_sim_C5=[X0_C5 (V0_C5_init/3.6) Angles0_C5]';     


x_tr_C5 = [X0_C5(1) 20 30 50 90 1000];        
y_tr_C5 = [X0_C5(1) 20 30 50 90 1000];

xx_rif_C5 = 0:Tc:(x_tr_C5(end));

for mt=1:length(xx_rif_C5)
    yy_rif_C5(1,mt)= X0_C5(2);
end


           % C4 PARAMETERS %


X0_C4 = [20 6];  
V0_C4_init = V0_C4(i); 
Angles0_C4 = 0;                   

init_sim_C4=[X0_C4 (V0_C4_init/3.6) Angles0_C4]';     


x_tr_C4 = [0 20 30 50 90 1000];        
y_tr_C4 = [0 20 30 50 90 1000];

xx_rif_C4 = 0:Tc:(x_tr_C4(end));

for nt=1:length(xx_rif_C4)
    yy_rif_C4(1,nt) = X0_C4(2);
end


              % C7 PARAMETERS %


X0_C7 = [-35 6]; 
V0_C7_init = V0_C7(i); 
Angles0_C7 = 0;                   

init_sim_C7=[X0_C7 (V0_C7_init/3.6) Angles0_C7]';     


x_tr_C7 = [0 20 30 50 90 1000];        
y_tr_C7 = [0 20 30 50 90 1000];

xx_rif_C7 = 0:Tc:(x_tr_C7(end));

for jt=1:length(xx_rif_C7)
    yy_rif_C7(1,jt) = X0_C7(2);
end

simulazioni = sim('PROVA_EGO_ACC_V5.slx');             %% we recall simulink model to run the simulation

result_acc(:,i) = acc_ego.signals.values(:,1);         %% we save the results of simulation (safety distances and acceleration values)
distanza_AA(:,i) = dist_AA.signals.values(:,1);
distanza_BB(:,i) = dist_BB.signals.values(:,1);
distanza_CC(:,i) = dist_CC.signals.values(:,1);

end
