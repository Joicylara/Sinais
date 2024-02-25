%  o caso em tempo continuo. Sistema com resposta ao impulso.
% h(t) = exp(-t) u(t) será definido como:

num = 1; % numerador
den = [1,1]; % denominador, que corresponde a 1s+1s^0
sys = tf(num, den); % definiçao da função de transferência
[h,t] = impulse(sys); % calculo da resposta ao impulso do sistema sys

%verificação

figure(1);
set(gca, 'FontSize', 18);
plot(t,h);
ylabel('h(t)');
xlabel('t(s)');

