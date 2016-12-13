%%function [avl,av_cc] = question_i()
  i =1;
  for g=0:0.1:1
    A=smallw(190,2,g);
    avl(i)=ave_path_length(A);
    av_cc(i)= mean(clustering_coefficients(A));
    i=i+1;
  end
  figure;
  plot([0:0.1:1],avl);
  plot([0:0.1:1],av_cc);
  saves(gcf,'./images/question_i');