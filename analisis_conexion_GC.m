function [Mat_b1_b2,Mat_b1_b2CC,Mat_b1_b2PP,CA_CC,aut1_CC,aut2_CC,CA_PP,aut1_PP,aut2_PP] = ...
    analisis_conexion_GC(bloque1,bloque2,peso_link,C1,P1,C2,P2)
% Funcion para dado los dos bloque de la matriz y los nodos centrales y
% perifericos calcular:
%
% - La matriz conjunta
% - La matriz conjunta conectada por los centrales con link de peso
% peso_link
% - La matriz conjunta conectada por los perifericos con link de peso
% peso_link
% - La centralidad de la red "dominante" tanto en caso CC como en caso PP
% - Los 2 mayores autovalores tanto en caso CC como en caso PP

Mat_b1_b2 = blkdiag(bloque1,bloque2);
fin1 = size(bloque1,1);
% CENTRALES----------------------------------------------------------------
Mat_b1_b2CC = Mat_b1_b2;
Mat_b1_b2CC(C1,fin1 + C2) = peso_link;
Mat_b1_b2CC(fin1 + C2,C1) = peso_link;
%Calculo la centralidad de esta nueva red
[lambda_vecCC,lambdaCC] = eigs(Mat_b1_b2CC,2);
%Centralidad de la red 1
U_t_1_cc = lambda_vecCC(:,1);
CA_CC = sum(U_t_1_cc(1:fin1))/sum(U_t_1_cc);
%Mayor autovalores
aut1_CC = lambdaCC(1,1);
aut2_CC = lambdaCC(2,2);
%PERIFERICOS---------------------------------------------------------------
Mat_b1_b2PP = Mat_b1_b2;
Mat_b1_b2PP(P1,fin1 + P2) = peso_link;
Mat_b1_b2PP(fin1 + P2,P1) = peso_link;
%Calculo la centralidad de esta nueva red
[lambda_vecPP,lambdaPP] = eigs(Mat_b1_b2PP,2);
%Centralidad de la red 1
U_t_1_pp = lambda_vecPP(:,1);
CA_PP = sum(U_t_1_pp(1:fin1))/sum(U_t_1_pp);
%Mayor autovalores
aut1_PP = lambdaPP(1,1);
aut2_PP = lambdaPP(2,2);