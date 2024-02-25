% Definir parâmetros
fs = 44100; % Frequência de amostragem
duracao = 0.5; % Duração de cada nota em segundos
pausa_duracao = 0.1; % Duração da pausa entre as notas em segundos

% Definir as frequências das notas musicais
notas = [ 987.77 987.77 987.77 987.77 987.77 987.77 987.77 987.77 987.77 ...
          587.33 783.99 880.00 987.77 880.00 987.77 987.77 987.77 987.77 ...
          880.00 880.00 587.33 587.33 783.99 ];

% Inicializar o sinal
sinal = [];

% Gerar o sinal concatenando as notas e pausas
for i = 1:length(notas)
    t = 0:1/fs:duracao-1/fs;
    nota = sin(2*pi*notas(i)*t);
    sinal = [sinal nota];

    % Adicionar pausa entre as notas
    pausa = zeros(1, round(fs * pausa_duracao));
    sinal = [sinal pausa];
end

% Ajustar o vetor de tempo para coincidir com o comprimento do sinal
t = linspace(0, length(sinal)/fs, length(sinal));

% Reproduzir o sinal
sound(sinal, fs);

% Plotar o sinal
plot(t, sinal);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal Gerado com a Sequência de Notas Musicais');

