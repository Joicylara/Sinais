
fs = 44100; % Frequência de amostragem

function playNote(frequency, duration, fs)
    t = 0:1/fs:duration;
    note = sin(2*pi*frequency*t);
    sound(note, fs);
    pause(duration);
end


noteDuration = 0.5; % Duração de cada nota em segundos

% Frequências das notas musicais
Si = 249.216;
Re = 148.104;
Sol = 197.736;
La = 222.024;
Doo = 264;  %nota Do

% Sequência de notas musicais

sequence = [Si Si Si Si Si Si Si Si Si Re Sol La Si Doo Doo Doo Re Doo Si Si Si Si La La Re];

% Reprodução da sequência
for i = 1:length(sequence)
    playNote(sequence(i), noteDuration, fs);
end

% Aguardar a reprodução ser concluída
pause(length(sequence) * noteDuration);


% Calcular a Transformada de Fourier
transformada = fft(sinal);
frequencias = linspace(0, fs, length(transformada));

% Plotar a magnitude da Transformada de Fourier
figure;
plot(frequencias, abs(transformada));
title('Transformada de Fourier do Sinal');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

