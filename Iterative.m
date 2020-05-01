function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  [graph_matrix nr_pages value1 value2] = file_to_graph(nume);
  R = zeros(nr_pages, 1);
  R(:) = 1 / nr_pages;
  R_next = R;
  M = zeros(nr_pages);
  for i = 1 : nr_pages
    for j = 1 : nr_pages
      if (graph_matrix(j,i) == 1)
        L_curent = sum(graph_matrix(j,:));
        M(i,j) = 1/L_curent;
      end
    end
  end
  disp(M);
  while true
    R_next = d * M * R + ((1 - d) / nr_pages) * ones(nr_pages, 1);
    err = norm(R_next - R);
    if err < eps
      return;
    end
    R = R_next;
  end

endfunction