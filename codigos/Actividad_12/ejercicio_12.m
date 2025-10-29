%% EJERCICIO 12 - FM Estéreo (Composite Baseband) con espectro simétrico
clear; clc; close all;

% Parámetros de muestreo
Fs = 200e3;              % Frecuencia de muestreo (200 kHz)
Ts = 1/Fs;
T = 0.05;                % Duración total (50 ms ? mejor resolución en frecuencia)
t = 0:Ts:T-Ts;

% --- Señales de audio L y R ---
fL = 5.2e3;              % Canal izquierdo
fR = 6e3;                % Canal derecho
mL = 1*cos(2*pi*fL*t);
mR = 1.5*cos(2*pi*fR*t);

% --- Suma y diferencia ---
mSigma = mL + mR;        % L+R
mDelta = mL - mR;        % L-R

% --- Tono piloto ---
fpilot = 19e3;
Apilot = 1;
pilot = Apilot*cos(2*pi*fpilot*t);

% --- DSB-SC (L-R) sobre subportadora 38 kHz ---
fsub = 38e3;
dsb_sc = mDelta .* cos(2*pi*fsub*t);

% --- Señal compuesta final ---
m = mSigma + pilot + dsb_sc;

% % --- Visualización temporal ---
% figure;
% plot(t*1e3, m);
% xlabel('Tiempo [ms]');
% ylabel('Amplitud [V]');
% title('Señal compuesta m(t) en el dominio del tiempo');
% grid on;
% xlim([0 2]);  % zoom temporal

% --- Análisis espectral ---
N = length(m);
M = fft(m)/N;               % FFT normalizada
M_shift = fftshift(M);      % Centrar en 0 Hz
f = (-N/2:N/2-1)*(Fs/N);    % Eje de frecuencias centrado

% --- Magnitud ---
figure;
plot(f/1e3, abs(M_shift), 'LineWidth', 1.3);
xlabel('Frecuencia [kHz]');
ylabel('Magnitud');
title('Espectro de la señal m(t)');
grid on;
xlim([-60 60]);            % Mostrar desde -60 kHz a +60 kHz


