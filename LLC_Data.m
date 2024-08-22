%% Parameter file: LLC_data.m
clear;clc;
%% Model Parameters
Ts_Power= 50e-9;        % Model sample time (s)   
%
%% LLC Data
Vdc_in=400;             % DC input voltage (V)
Vo_nom=360;             % DC nominal output voltage (V)
V_o_min = 275;
V_o_max = 450;

Po_nom=6.6e3;           % Nominal output power (W)
Lr=20e-6;               % Transformer leakage reactance (H)
Lm=100e-6;              % Magnetization inductance (H)
Cr=140e-9;              % Resonant capacitor (F)
Np=11; Ns=10; N=Np/Ns;  % Transformer ratio
Co=560e-6;              % Output filter (F)
Ron_FET=50e-3;          % FET resistance (ohms)
Ron_Diode=50e-3;        % FET resistance (ohms)
Vf=0.6;                 % Diode forward voltage (V)

%% LLC Control System Parameters
DT_LLC=400e-9;
Ts_Control=10e-6;
% Voltage Regulator (PI): 
Kp_LLC= 5e3;            % Proportional gain 
Ki_LLC= 500e3;          % Integral gain
fs_LCC_min= 40e3;       % Minimum switching frequency (Hz)
fs_LCC_max= 250e3;      % Maximum switching frequency (Hz)

%%
% Resonant tank data
Ro=Vo_nom^2/Po_nom;      % LLC nominal output load (Ohm)
Rac=(8/pi^2)*N^2*Ro;     % Equivalent primary AC resistance (Ohm)
Q=sqrt(Lr/Cr)/Rac;       % Quality factor
fr=1/(2*pi*sqrt(Lr*Cr)); % Resonant frequency (Hz)
m=(Lr+Lm)/Lr;            % Ratio of total primary reactance to resonant inductance (Lr) 

%%
% Ro = 24.24;