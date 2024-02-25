clear;
clc;

sample_rate = 44100;

function wave = generate_note(note, duration, sample_rate)
  frequencies = struct('Si', 493.88, 'Dó', 523.55, 'Ré', 587.33, 'Sol', 783.99, 'Lá', 880.00);
  t = 0:1/sample_rate:duration;
  wave = sin(2*pi*frequencies.(note)*t);
endfunction

notes_seq = {'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Ré', 0.3, 'Sol', 0.3, 'Lá', 0.3, 'Si', 0.3, 'Dó', 0.3, 'Dó', 0.3, 'Dó', 0.3, 'Ré', 0.3, 'Dó', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Si', 0.3, 'Lá', 0.3};

full_wave = [];
for i = 1:2:length(notes_seq)-1
  note = notes_seq{i};
  duration = notes_seq{i+1};
  note_wave = generate_note(note, duration, sample_rate);
  full_wave = [full_wave, note_wave];
end

sound(full_wave, sample_rate);

fft_sgnal = fft(full_wave);
amplitude = abs(fft_sgnal);
N = length(full_wave);
frequencies = (0:N-1)*(44100/N);
plot(frequencies, amplitude);
xlabel('frequencia (Hz)');
ylabel('amplitude');
title('transformada de Fourier do sinal de audio');

