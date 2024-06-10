function [adj_GC,Central_node,Peripheral_node,max_eigenvalue_1,max_eigenvalue_2] = Giant_component(adj,GC_nodes)
% Dada la matriz de adyacencia original y la lista de nodos de la
% componente gigante esta funcion obtendra:
% - La matriz de adyacencia de la componente gigante adj_GC
% - El nodo central de la componente gigante segun la eigenvector
% centrality central_node
% - El mayor autovalor de la componente gigante max_eigenvalue

% Formato de inputs: 
% adj: matriz binaria simetrica
% Gc_nodes: vector FILA con los nodos de la componente gigante

% Matriz de adyacencia componente gigante
temp = size(GC_nodes,2);
adj_GC = zeros(temp);
for i = 1:temp
    for j = 1:temp
        adj_GC(i,j) = adj(GC_nodes(i),GC_nodes(j));
    end
end
%Si la matriz es muy grande la devolvemos como Sparse
if temp>1000    
    adj_GC = sparse(adj_GC);
end

ec = eigenvector_centrality_und_MOD(adj_GC);
[ec_max, node_ec_max] = max(ec);
[lambda_vec,lambda] = eigs(adj_GC,2);
[C,ia,ic] = unique(ec);

%Nodo mas periferico
Peripheral_node = ia(1);
%Nodo mas central
Central_node = node_ec_max;
%Mayor autovalor
max_eigenvalue_1 = lambda(1,1);
max_eigenvalue_2 = lambda(2,2);
