clc
clear

% Define la función objetivo y los coeficientes
fun = @(x) 1.1*x(1) + 1.2*x(2) + 2*x(3) + 1.3*x(4) + 3*x(5);
x0 = [1,1,1,1,1]; % Valor inicial de las variables

% Define las restricciones lineales en forma de matrices A y b
A = [
    -8, -2, -15, -4, -30;
    -9, -3, -3, -1, -9;
    -35, -3, -17, -1, -16;
    -100, -90, -350, -200, -410;
    -10, -20, -40, -25, -40

];
b = [-60; -100; -120; -2100; -400;
     ];



% Define los límites de las variables (límites inferiores y superiores)
lb = [0,0,0,0,0];
ub = [];

% Opciones de fmincon
options = optimoptions('fmincon', 'Algorithm', 'sqp', 'Display', 'iter');

% Resuelve el problema de optimización
[x, fval, exitflag, output] = fmincon(fun, x0, A, b, [], [], lb, ub, [], options);

% Imprime la solución y el valor óptimo de la función objetivo
disp('Solución encontrada:');
disp(['x1 = ', num2str(x(1))]);
disp(['x2 = ', num2str(x(2))]);
disp(['x3 = ', num2str(x(3))]);
disp(['x4 = ', num2str(x(4))]);
disp(['x5 = ', num2str(x(5))]);
disp(['Valor óptimo de la función objetivo: ', num2str(fval)]);

