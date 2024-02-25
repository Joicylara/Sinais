
clc;
n_valores = [3,11,49];
t = linspace(-1,2,1000);

for i = 1:length(n_valores)
  n = n_valores(i);
  xt =(2*(1-cos(9*n*pi))/(n*pi))*sin(n*pi*t);

  figure;
  plot(t,xt);
  title(['Gráfico de x(t) para n = ' num2str(n)]);
  xlabel('t');
  ylabel('x(t)');
  grid on;
  end
