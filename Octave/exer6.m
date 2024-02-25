% Parâmetros do sinal original
% questão 6 a
fs = 200;  % Frequência de amostragem (pelo menos 200 Hz para evitar aliasing)
t_original = linspace(0, 1, fs);  % Vetor de tempo para o sinal original
x_original = sin(2*pi*40*t_original) + sin(2*pi*100*t_original);  % Sinal original

% questão 6 c
% Parâmetros do sinal senoidal de 60 Hz
f_senoidal = 60;  % Frequência da senoide de 60 Hz
t_senoidal = linspace(0, 1, fs);  % Vetor de tempo para a senoide de 60 Hz
x_senoidal = 0.5 * sin(2*pi*f_senoidal*t_senoidal);  % Sinal senoidal de 60 Hz com amplitude reduzida (0.5)

% Adiciona a senoide de 60 Hz ao sinal original para gerar ruído
x_ruidoso = x_original + x_senoidal;

% Plota os sinais
figure;
subplot(3,1,1);
plot(t_original, x_original);
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;
% questão 6 d
axis([0 1 -2 2]);  % Ajusta os limites do eixo x e y com o intervalo de 0 ≤ t ≤ 1.

subplot(3,1,2);
plot(t_senoidal, x_senoidal);
title('Sinal Senoidal de 60 Hz');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;
axis([0 1 -1 1]);  % Ajusta os limites do eixo x e y

subplot(3,1,3);
plot(t_original, x_ruidoso);
title('Sinal Ruidoso');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;
axis([0 1 -2 2]);  % Ajusta os limites do eixo x e y

%questão 6 e
% Calcula a Transformada de Fourier
frequencies = linspace(-fs/2, fs/2, fs);  % Frequências associadas à DFT
X_original = fftshift(fft(x_original));
X_ruidoso = fftshift(fft(x_ruidoso));

% Plota as Transformadas de Fourier
figure;

subplot(2,1,1);
plot(frequencies, abs(X_original));
title('Transformada de Fourier do Sinal Original');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
grid on;

subplot(2,1,2);
plot(frequencies, abs(X_ruidoso));
title('Transformada de Fourier do Sinal Ruidoso');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
grid on;

sgtitle('Transformada de Fourier dos Sinais Original e Ruidoso');
