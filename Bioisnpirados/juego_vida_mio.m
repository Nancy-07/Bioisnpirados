% Configuración inicial
tamano_tablero = 10; % Tamaño del tablero (puedes ajustarlo según tus preferencias)
probabilidad_inicial = 0.3; % Probabilidad de que una célula esté viva al inicio

% Inicializar el tablero
tablero = rand(tamano_tablero) < probabilidad_inicial;

% Bucle principal
generaciones = 100; % Número de generaciones a simular

for generacion = 1:generaciones
    % Mostrar el estado actual del tablero
    disp(['Generación: ' num2str(generacion)]);
    disp(tablero);
    
    % Calcular el próximo estado del tablero
    nuevo_tablero = zeros(size(tablero));
    
    for fila = 1:tamano_tablero
        for columna = 1:tamano_tablero
            % Calcular el número de vecinos vivos
            vecinos_vivos = sum(vecinos(tablero, fila, columna, tamano_tablero));
            
            % Aplicar reglas del Juego de la Vida
            if tablero(fila, columna) == 1 % Célula viva
                if vecinos_vivos < 2 || vecinos_vivos > 3
                    nuevo_tablero(fila, columna) = 0; % Muere por soledad o superpoblación
                else
                    nuevo_tablero(fila, columna) = 1; % Sobrevive
                end
            else % Célula muerta
                if vecinos_vivos == 3
                    nuevo_tablero(fila, columna) = 1; % Nace debido a la reproducción
                end
            end
        end
    end
    
    % Actualizar el tablero al nuevo estado
    tablero = nuevo_tablero;
    
    % Pausa para visualización (opcional)
    pause(0.5);
end

% Función para obtener los vecinos de una célula en el tablero
function vecinos = vecinos(tablero, fila, columna, tamano_tablero)
    vecinos = [];
    for i = -1:1
        for j = -1:1
            if i ~= 0 || j ~= 0
                vecino_fila = mod(fila + i - 1, tamano_tablero) + 1;
                vecino_columna = mod(columna + j - 1, tamano_tablero) + 1;
                vecinos = [vecinos; tablero(vecino_fila, vecino_columna)];
            end
        end
    end
end
