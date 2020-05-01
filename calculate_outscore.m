function a = calculate_outscore(graph, PR, index, nr_pages)
  a = 0;
  for i = 1 : nr_pages
    if (graph(index, i) == 1)
      a = a + PR(i);
    end
  end
endfunction
