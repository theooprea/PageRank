function [A nr_pages value1 value2] = file_to_graph(nume_fisier)
  fisier = fopen(nume_fisier, "r");
  nr_pages = fscanf(fisier, "%d\n", 1);
  A = zeros(nr_pages);
  for i = 1 : nr_pages
    linie = fgetl(fisier);
    linie_numbers = sscanf(linie, "%d");
    [n m] = size(linie_numbers);
    page_number = linie_numbers(1);
    for j = 3 : n
      A(page_number, linie_numbers(j)) = A(page_number, linie_numbers(j)) + 1;
    end
  end
  linie = fgetl(fisier);
  value1 = sscanf(linie, "%f");
  linie = fgetl(fisier);
  value2 = sscanf(linie, "%f");
  for i = 1 : nr_pages
    A(i,i) = 0;
  end
endfunction