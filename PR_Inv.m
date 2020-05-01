function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
  [n n] = size(A);
  B = zeros(n);
  [Q R] = gram_schmidt(A);
  for i = 1 : n
    t = zeros(n, 1);
    e = zeros(n, 1);
    e(i) = 1;
    e = Q' * e;
    t = SST(R, e);
    B(:,i) = t;
  end
endfunction