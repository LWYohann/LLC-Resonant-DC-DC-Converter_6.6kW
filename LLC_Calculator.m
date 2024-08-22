% LLC Calculator
clear;clc;


%%
m= 6;

for Q = [0.2:0.1:0.7 1.6]
    F_x = logspace(-1,1,200);
    K = F_x.^2.*(m-1)./sqrt((m.*(F_x.^2)-1).^2 + F_x.^2.*(F_x.^2-1).^2.*(m-1).^2.*Q.^2);      % Resonant tank Gain
    semilogx(F_x,K,'DisplayName',"K=" + num2str(Q),LineWidth=1.2)
    hold on
end
% yline(1.1)
% yline(0.6)
legend


%%
L_r = 20e-6;
C_r = 140e-9;
f_s = 100e3;
L_m = 100e-6;
R_o = 360*360/6600;
N_p = 1.1;
N_s = 1;

%%

f_r = 1/(2*pi*sqrt(L_r * C_r));             % Resonant frequency
R_ac = 8*N_p^2*R_o/(pi^2)/(N_s^2);          % Reflected load resistance
F_x = f_s / f_r;                            % Normalized switching frequency
m = (L_r + L_m)/L_r;                        % Ratio of total primary inductance to resonant inductance
Q = sqrt(L_r/C_r)/R_ac;                     % Quality factor

K = F_x^2*(m-1)/sqrt((m*(F_x^2)-1)^2 + F_x^2*(F_x^2-1)^2*(m-1)^2*Q^2);      % Resonant tank Gain
