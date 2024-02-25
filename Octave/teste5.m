clc;
clear;

% Mudar a frequência de amostragem para 1/4 da original
fs_nova = 44100 / 4;  % Nova frequência de amostragem (1/4 da original)
nbits = 16;           % Bits da placa de áudio

% Ler arquivo WAV
arquivo = 'minha_voz.wav';
info = audioinfo(arquivo);
[audio_wav, ~] = audioread(arquivo);
audio_wav = audio_wav(:, 1)';  % Canal 1

% Escutar o som
soundsc(audio_wav, fs_nova, nbits);

% Gravar o arquivo com a nova frequência de amostragem
nome_novo_arquivo = 'nova_voz.wav';
audiowrite(nome_novo_arquivo, audio_wav, fs_nova);

% Plotar o áudio no domínio do tempo
tfinal = length(audio_wav) / fs_nova;
t = linspace(0, tfinal, length(audio_wav));

figure;
subplot(2, 1, 1);
plot(t, audio_wav);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal de Áudio');

% Calcular a Transformada de Fourier (FFT)
normal = length(audio_wav);
auxiliar = 0:normal-1;
T = normal/fs_nova;
fre = auxiliar/T;
Y = abs(fft(audio_wav)/normal);
frec = ceil(normal/2);
Y = Y(1:frec);

% Plotar o espectro de frequência
subplot(2, 1, 2);
plot(fre(1:frec), Y);
xlabel('Frequência (Hz)');
ylabel('Amplitude');
title('Espectro do Sinal de Voz (Nova Frequência de Amostragem)');

disp(['Arquivo gravado com nova frequência de amostragem como: ' nome_novo_arquivo]);

