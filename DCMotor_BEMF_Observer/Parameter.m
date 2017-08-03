% DC motor Parameter

Ra=0.25; % Stator Resistencs
La=0.5e-3; %stator inductance
Kw=0.0573;%Motor constant
Nrated=2000; % rpm

Wrated=Nrated/60*2*pi; % rated speed in rad per sec
Prated=50; % rated power Watt

Trated=Prated/Wrated; % rated torque Nm

Jm=1e-4; % Motor Inertia
% Observer Paramter

Kp=1; % Proportional Gain
Ti= La/Ra; % Intergral Time Constant






