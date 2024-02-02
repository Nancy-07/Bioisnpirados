function random = xorshift(seed, n)
    % Parámetros del algoritmo XORshift
    a = uint32(42);
    b = uint32(8);
    c = uint32(4);
    n = n+1;
    % Inicialización del estado interno
    state = uint32(seed);
    
    % Preasignación de matriz para almacenar los números aleatorios
    random = zeros(1, n-1, 'uint32');
    
    % Generación de números aleatorios
    for i = 1:n-1
        state = bitxor(bitxor(bitxor(state, bitshift(state, a)), bitshift(state, -b)), bitshift(state, c));
        random(i) = state;
    end
end