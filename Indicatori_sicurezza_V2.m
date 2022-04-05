%% CALCULATION OF THE MINIMUM VALUES FOR EACH SAFETY INDICATOR

for i  = 1 : 3037
    min_acc(1,i) = min(result_acc(:,i));
end

for i  = 1 : 3037
    min_AA(1,i) = min(distanza_AA(:,i));
    
end

for i  = 1 : 3037
    min_BB(1,i) = min(distanza_BB(:,i));
end

for i  = 1 : 3037
    min_CC(1,i) = min(distanza_CC(:,i));
end

%% AUTOMATIC CRITICAL CASES ANALYSIS


for k = 1 : length(min_AA)
    if min_AA(1,k) > 1 && min_AA(1,k) < 1.8 || min_BB(1,k) > 1 && min_BB(1,k) < 1.8 || min_CC(1,k) > 1 && min_CC(1,k) < 1.8
        indicatore_distanza(k,1) = k;
        
       
        
        if min_AA(1,k) > 1 && min_AA(1,k) < 1.8
        indicatore_distanza(k,2) = min_AA(1,k)
        end
        
        if  min_BB(1,k) > 1 && min_BB(1,k) < 1.8
        indicatore_distanza(k,3) = min_BB(1,k)
        end
        
        if min_CC(1,k) > 1 && min_CC(1,k) < 1.8
        indicatore_distanza(k,4) = min_CC(1,k)
        end
        

    end
    
    if min_AA(1,k) < 1 || min_BB(1,k) < 1 || min_CC(1,k) < 1
        indicatore_distanza(k,5) = k;  
        
        
        if min_AA(1,k) < 1                         %%   ACCIDENT
        indicatore_distanza(k,6) = min_AA(1,k)
        end
        
        if min_BB(1,k) < 1 
        indicatore_distanza(k,7) = min_BB(1,k)
        end
        
        if min_CC(1,k) < 1
        indicatore_distanza(k,8) = min_CC(1,k)
        end
        
    end
    
    if min_AA(1,k) >= 1.8  && min_BB(1,k) >= 1.8  && min_CC(1,k) >= 1.8         %% passed
        indicatore_distanza(k,9) = k;
     

    end
end
     

%% NUMBER OF CRITICAL CASES IDENTIFIED 

n_test_critici_tot = nnz(indicatore_distanza(:,1));
n_test_critici_AA = nnz(indicatore_distanza(:,2));
n_test_critici_BB = nnz(indicatore_distanza(:,3));
n_test_critici_CC = nnz(indicatore_distanza(:,4));

%% I EXPORT THE INDICATORS IN EXCEL

nomefile = 'indicatori_sicurezza_random2_3w.xlsx' ;
writematrix(indicatore_distanza,nomefile, 'Sheet',1,'Range','A1');
%% I EXPORT THE TEST SUITE IN EXCEL

nomefile = 'TEST_SUITE_RANDOM2_3W.xlsx' ;
writematrix(param_random,nomefile, 'Sheet',1,'Range','A1');