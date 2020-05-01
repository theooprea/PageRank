function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	[graph_matrix nr_pages value1 value2] = file_to_graph(nume);
  R = zeros(nr_pages, 1);
  M = zeros(nr_pages);
  for i = 1 : nr_pages
    for j = 1 : nr_pages
      if (graph_matrix(j,i) == 1)
        L_curent = sum(graph_matrix(j,:));
        M(i,j) = 1/L_curent;
      end
    end
  end
  I = eye(nr_pages);
  matrix_inverse = PR_Inv(I - d * M);
  R = matrix_inverse * ((1 - d) / nr_pages) * ones(nr_pages, 1);
endfunction