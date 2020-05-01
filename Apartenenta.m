function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
  [n, a] = size(x);
  y = zeros(n, 1);
	index = x(:, 1) < val1;
  y(index) = 0;
  index = x(:, 1) > val2;
  y(index) = 1;
  a = 1 / (val2 - val1);
  b = 1 - val2 / (val2 - val1);
  index = x(:, 1) > val1 & x(:, 1) < val2;
  y(index) = x(index) .* a + b;
endfunction
