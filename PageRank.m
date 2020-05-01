function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  nume_out = strcat(nume, ".out");
  fisier = fopen(nume_out, "w");
  [A nr_pages value1 value2] = file_to_graph(nume);
  fprintf(fisier, "%d\n\n", nr_pages);
  R1 = Iterative(nume, d, eps);
  for i = 1 : nr_pages
    fprintf(fisier, "%f\n", R1(i));
  endfor
  fprintf(fisier, "\n");
  R2 = Algebraic(nume, d);
  for i = 1 : nr_pages
    fprintf(fisier, "%f\n", R2(i));
  endfor
  fprintf(fisier, "\n");
  R_last_task = Apartenenta(R2, value1, value2);
%  for i = 1 : nr_pages
%    fprintf(fisier, "%f\n", R_last_task(i));
%  end
  matrix_last_task = zeros(nr_pages, 2);
  for i = 1 : nr_pages
    matrix_last_task(i, 1) = i;
    matrix_last_task(i, 2) = R_last_task(i);
  end
  for i = 1 : nr_pages - 1
    for j = i + 1 : nr_pages
      if (matrix_last_task(i, 2) < matrix_last_task(j, 2))
        aux = matrix_last_task(i, :);
        matrix_last_task(i, :) = matrix_last_task(j, :);
        matrix_last_task(j, :) = aux;
      end
      if (matrix_last_task(i, 2) == matrix_last_task(j, 2))
        score_i = calculate_outscore(A, R2, matrix_last_task(i, 1), nr_pages);
        score_j = calculate_outscore(A, R2, matrix_last_task(j, 1), nr_pages);
        if (score_i < score_j)
          aux = matrix_last_task(i, :);
          matrix_last_task(i, :) = matrix_last_task(j, :);
          matrix_last_task(j, :) = aux;
        end
      end
    end
  end
  for i = 1 : nr_pages
    fprintf(fisier, "%d %d %f\n", i, matrix_last_task(i, 1), matrix_last_task(i, 2));
  end
  fclose(fisier);
endfunction