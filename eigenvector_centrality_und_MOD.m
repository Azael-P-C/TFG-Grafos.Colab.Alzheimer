function   v = eigenvector_centrality_und_MOD(CIJ)
%EIGENVECTOR_CENTRALITY_UND      Spectral measure of centrality
%   v = eigenvector_centrality_und(CIJ)
%   Inputs:     CIJ,        binary/weighted undirected adjacency matrix.
%   Outputs:      v,        eigenvector associated with the largest
%                           eigenvalue of the adjacency matrix CIJ.
%   Reference: Newman, MEJ (2002). The mathematics of networks.
%   Contributors:
%   Xi-Nian Zuo, Chinese Academy of Sciences, 2010
%   Rick Betzel, Indiana University, 2012
%   Mika Rubinov, University of Cambridge, 2015
%   MODIFICATION HISTORY
%   2010/2012: original (XNZ, RB)
%   2015: ensure the use of leading eigenvector (MR)
n = length(CIJ);
if n < 100 %LA MODIFICACION ES PONER 100 EN VEZ DE 1000
    [V,D] = eig(CIJ);
else
    [V,D] = eigs(sparse(CIJ));
end
[~,idx] = max(diag(D));
ec = abs(V(:,idx));
v = reshape(ec, length(ec), 1);