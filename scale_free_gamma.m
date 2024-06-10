function [gamma,extra] = scale_free_gamma(cdfm,max_k)
% Dada la cummulative degree distribution cdf(K) del grado MAYOR IGUAL K
% se buscara el gamma tal que cdf(K) ~= K^(-gamma):
% Input:
% - cdf(K) en MAYOR O IGUAL que K
% - max_k == Valor del grado maximo (Maximo K)
% Output:
% - gamma
% - extra = β0 = para la representacion de la FPG(k)
%--------------------------------------------------------------------------
% Se opera la FGA(K) para poder aplicar la regresion:
logcdf = log10(cdfm);
% Los grados tambien a escala logaritmica
x = transpose(log10(1:max_k));
% Simplificamos la notacion
y = logcdf;
%Calculamos y=β1x+β0 con β0=b y β1= - gamma
reg = polyfit(x,y,1);
gamma = -reg(1);
extra = reg(2);