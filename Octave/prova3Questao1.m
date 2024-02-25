% Definir as notas e a frequência de amostragem
nota_DO = 261.63;
RE = 293.66;
MI = 329.63;
FA = 349.23;
SOL = 392;
LA = 440;
SI = 493.88;

% Definir as notas musicais
notas = [SI, SI,SI, SI, SI, SI, SI, SI, SI, RE, SOL, LA,SI,nota_DO, nota_DO, ...
         nota_DO, RE, nota_DO, SI, SI, SI, SI, LA, LA, RE,SI,SI,SI,SI,SI,SI,SI, ...
         SI,SI,RE,SOL,LA,SI, nota_DO, nota_DO, nota_DO, RE, nota_DO, SI, SI, SI, ...
         RE, RE, nota_DO, LA, SOL];

fs = 44100; % Frequência de amostragem

% Inicializar o sinal
sinal = [];

% Gerar o sinal para cada nota
for i = 1:length(notas)
    duracao = 0.2; % Duração de cada nota em segundos
    t = 0:1/fs:duracao-1/fs;
    nota = 0.1*sin(2*pi*notas(i)*t);
    sinal = [sinal nota];
end

% Reproduzir o sinal
sound(sinal, fs);

% Calcular a Transformada de Fourier
transformada = fft(sinal);
frequencias = linspace(0, fs, length(transformada));

% Plotar a magnitude da Transformada de Fourier
figure;
plot(frequencias, abs(transformada));
title('Transformada de Fourier do Sinal');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

