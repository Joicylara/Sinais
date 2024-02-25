%  o caso em tempo continuo. Sistema com resposta ao impulso.
% h(t) = exp(-t) u(t) será definido como:

num = 1; % numerador
den = [1,1]; % denominador, que corresponde a 1s+1s^0
sys = tf(num, den); % definiçao da função de transferência, sy = 1/s+1
[h,t] = impulse(sys); % calculo da resposta ao impulso do sistema sys

%verificação

figure(1);
set(gca, 'FontSize', 18);
plot(t,h);
ylabel('h(t)');
xlabel('t(s)');





% entrada senoidal, tempo contínuo

t = 0:0.01:20; % de 0 até 20 segundos, com incrementos de 0.01(vetor de tempo)
w0 = 3; % definição da frequência
x = cos(w0*t); % entrada

% simulação para entrada senoidal

y = lsim(sys,x,t); % saída

%gráfico dos primeiros instantes(regime transitorio)
figure(2)
set(gca, 'Fontsize', 18);
plot(t(1:500),x(1:500),'b', t(1:500),y(1:500),'r'); % gráfico, olhando pra os primeiros 500 valores
grid
ylabel('x(t) e y(t)'); % o primeiro pico de y(t) é um pouco mais baixo que o segundo, ele é o transiente, logo todos serão da mesma amplitude, tendo chegado ao estado estaionário
xlabel('t(s)');
axis([0 5 -1.2 1.2]);


% o caso em tempo discreto
% entrada senoidal
k = 1:1000; % defição de amostra( vetor de amostra de 1 até 1000)
w0 = pi/10; % frequência, sendo pi a frequênia máxima que se pode ter em um tempo discreto
x = cos(w0*k); % sinal cossenoidal

% simulação do sistema para entrada senooidal
% condições iniciais nulas

y(1) = 0;
y(2) = 0;

for n=3:length(k)
  y(n) = (3/4)*y(n-1)-(1/8)*y(n-2)+2*x(n); % y[n] = (3/4)y[n-1]+(1/8)y[n-2] = 2x[n]
end;
% deve ter condiçõs iniciais, que foi optado nulas

% gráfico dos primeiros instantes(regime transitorio)

figure(3)
set(gca, 'FontSize', 18);
stem(k(1:50), x(1:50),'b'); % entra x(bolinhas azuis), amplitude 1
hold on
stem(k(1:50),y(1:50),'r'); % saída y( traços vermelhos), amplitude 5 em relação ao dois no inicio tem o transiente, logo deppois a saída atinge o estado estacionário, senoidal, com a mesma frequência de entrada
holdo off
