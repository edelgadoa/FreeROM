% Script para leer y graficar los datos de Indicador.txt e Indicador_FE.txt
clc; clear; close all;

% ---------------------------------------------------------
% 1. LEER LOS 6 VECTORES NORMALES (Indicador.txt)
% ---------------------------------------------------------
filename1 = 'Indicador.txt'; 
fileID1 = fopen(filename1, 'r');
if fileID1 == -1
    error('No se pudo abrir "%s". Asegúrate de que existe en el directorio actual.', filename1);
end

num_vectores = 6;
num_elementos = 20;
vectores = zeros(num_vectores, num_elementos);

for i = 1:num_vectores
    encabezado = fscanf(fileID1, '%f', 1);
    if isempty(encabezado)
        break; 
    end
    valores = fscanf(fileID1, '%f', num_elementos);
    vectores(i, :) = valores';
end
fclose(fileID1);

% ---------------------------------------------------------
% 2. LEER EL VECTOR DE REFERENCIA (Indicador_FE.txt)
% ---------------------------------------------------------
filename2 = 'Indicador_FE.txt'; 
fileID2 = fopen(filename2, 'r');
if fileID2 == -1
    error('No se pudo abrir "%s". Asegúrate de que existe en el directorio actual.', filename2);
end

vector_referencia = zeros(1, num_elementos);
encabezado_FE = fscanf(fileID2, '%f', 1); % Leer el '20' que precede al bloque

if ~isempty(encabezado_FE)
    % Leer los 20 elementos con alta precisión del archivo FE
    valores_FE = fscanf(fileID2, '%f', num_elementos);
    vector_referencia = valores_FE';
end
fclose(fileID2);

% ---------------------------------------------------------
% 3. CREACIÓN DE LA GRÁFICA
% ---------------------------------------------------------
figure('Name', 'Vectores vs Referencia FE', 'NumberTitle', 'off', 'Position', [100, 100, 800, 500]);
hold on;

% Paleta de colores para los 6 vectores
colores = lines(num_vectores); 

% A) Graficar los 6 vectores de Indicador.txt
for i = 1:num_vectores
    plot(1:num_elementos, vectores(i, :), '-o', ...
         'LineWidth', 1.2, ...
         'MarkerSize', 4, ...
         'MarkerFaceColor', colores(i,:), ...
         'Color', colores(i,:), ...
         'DisplayName', sprintf('Vector %d', i));
end

% B) Graficar el vector de referencia de Indicador_FE.txt
% Usaremos color negro ('k'), línea punteada ('--') y cuadrados ('s') para destacarlo
plot(1:num_elementos, vector_referencia, '--ks', ...
     'LineWidth', 2.5, ...
     'MarkerSize', 7, ...
     'MarkerFaceColor', 'k', ...
     'DisplayName', 'Vector Objetivo (FE)');

hold off;

% Configuración visual
grid on;
title('Evolución de los 6 vectores frente al objetivo (FE)', 'FontSize', 14);
xlabel('Índice', 'FontSize', 12);
ylabel('Valor', 'FontSize', 12);
legend('Location', 'best');
xlim([1, 20]);
xticks(1:20);