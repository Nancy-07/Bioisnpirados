ls = 10;
li = -10;
var = 2;
poblacion = 10;
current_time = round(second(datetime("now")));
repeticiones = 30;
resultados = [];

for g = 1: repeticiones
    num = randi([li ls], poblacion, var);
    iteraciones = 900;
    velocidades = zeros(size(num));
    p_best = num;
    x_1 = num(:, 1);
    x_2 = num(:, 2);
    fx_first = funcionObj(x_1, x_2);
    [maximo_1, indice_1] = min(fx_first);
    g_best = num(indice_1, :);
    c1 = 1.5;
    c2 = 1.5;
    w = 0.6;
    cumulo = num;

    for i = 1:iteraciones
        mejor = funcionObj(g_best(1), g_best(2));
   
              % Detener el programa
        

        for j = 1:poblacion
            velocidad = velocidades(j, :);
            fx_1 = funcionObj(cumulo(j, 1), cumulo(j, 2));
            velocidadN = (w * velocidad) + (p_best(j, :) - cumulo(j, :)) * (c1 * rand(1)) + (g_best - cumulo(j, :)) * (c2 * rand(1));
            velocidades(j, :) = velocidadN;
            cumulo(j, :) = cumulo(j, :) + velocidadN;
            fx_2 = funcionObj(cumulo(j, 1), cumulo(j, 2));

            if fx_2 < fx_1
                p_best(j, :) = cumulo(j, :);
            end
        end

        x_11 = p_best(:, 1);
        x_22 = p_best(:, 2);
        fx_11 = funcionObj(x_11, x_22);
        [min_11, indice_11] = min(fx_11);

        if min_11 < mejor
            g_best = cumulo(indice_11, :);
        end

        mejor = funcionObj(g_best(1), g_best(2));
    end
    
    costo = poblacion*i;
    datos = [g_best(1) g_best(2) mejor costo];
    resultados = [resultados; datos];
    
    
end

cadena = sprintf('Obtenemos el  X  Y   Minimizar    Función objetivo   Número de iteraciones ');
disp(cadena);
disp(resultados)



estadistica = resultados(:, 3);

desviacion_estandar = std(estadistica)
[mejor_r, mejor_c] = min(estadistica);
[peor_r, peor_c] = max(estadistica);
promedio = mean(estadistica)





function resultado = funcionObj(x1, x2)
    resultado =  (2*x1 + 3*x2.^2 - 22).^2 + (2*x1 + x2 - 8).^2;
end


