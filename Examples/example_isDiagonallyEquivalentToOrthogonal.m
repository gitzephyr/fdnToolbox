% Sebastian J. Schlecht, Thursday, 9 January 2020
clear; clc; close all;

rng(1)
N = 5;

%% Generate random orthogonal matrix and diagonal matrices
Q = orth(randn(N));
D = diag(randn(N,1)+1);
E = diag(randn(N,1)+1);

A = diagonallyEquivalent(Q,D,E);

%% Check whether A is diagonally equivalent to an orthogonal matrix
[isDOE,Q2,D2,E2] = isDiagonallyEquivalentToOrthogonal(A)


%% Test with diagonallyEquivalent
B = diagonallyEquivalent(Q,D,inv(D));

[isDOS,Q,D] = isDiagonallySimilarToOrthogonal(B, 'tol', 10^-10)
