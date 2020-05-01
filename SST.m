function [x] = SST(A,b)
  [n n] = size(A);
  x = zeros(n, 1);
  for i = n : -1 : 1
    suma = 0;
    for j = i + 1 : n
      suma = suma + x(j) * A(i,j);
    end
    x(i) = (b(i) - suma) / A(i,i);
  end
end
