T = 800;           %% work temp   
P_den    = 749;    %% given
T_boil   = 489.5;  %% by chart
h_fg     = 256;    %% by chart
MW_a     = 170.337;%% by chart
D_ab_399 = 8.1e-6; %% by chart
Air_kind = 28.014; %%

D_ab_800 = D_ab_399 * (T/399)^(3/2); 
P_sat    = exp(-h_fg/(8315/MW_a)*(1/479.5-1/489.5))
X_a      = P_sat/1;
Y_as     = X_a*MW_a/(X_a*MW_a+(1-X_a)*Air_kind)
B_y      = Y_as/(1-Y_as)
P_air    = 101325/(8315/28.014*800); %% P means low(pronunce)

k  = (8*P_air*D_ab_800/749)*log(1+B_y)



