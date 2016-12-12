function question_i()
for g=0:1:0.1:1
    A=smallw(100,200,g);
    avl=ave_path_length(A);
    avgroup = clust_coeff(A);
    disp(avl)
    disp(avgroup)
end