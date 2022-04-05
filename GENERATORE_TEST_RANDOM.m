clear all
clc

v = [40 45 50 55 60 65 70 75 80];                                                 %% speeds vector
acc = [-8 -7.5 -7 -6.5 -6 -5.5 -5 -4.5 -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0];        %% decelerations vector 


randomIndex_v = randi(length(v), 3037,4);    %% we use randi function to generate random test suites
param_random(:,1:4) = v(randomIndex_v);                     

randomIndex_acc = randi(length(acc), 3037,2);      
param_random(:,5:6) = acc(randomIndex_acc);   
