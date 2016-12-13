%% REG

clear;
vertices = 190;
acc_vertices = (1:vertices)/vertices;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

reg = smallw(vertices, 2, 0);
G.Adj = full(reg);
G.nv = vertices;
G.ne = sum(sum(full(reg)))/2;
reg_deg = sum(full(reg),2);

 plotGraphBasic(G, markerSize, addText);
% saveas(gcf,'results/reg/reg_graph.png');
% [~, cumdist, dist] = cumulativedist(reg_deg,vertices);
% figure;bar(dist);
% saveas(gcf,'results/reg/reg_dist.png');
% figure;bar(cumdist);
% saveas(gcf,'results/reg/reg_cumdist.png');
reg_mean = mean(reg_deg);
reg_std = std(reg_deg);

% % weighted
% regW = 1 + 9.*rand(vertices);
% regW = triu(regW,1) + triu(regW,1)'; % has to be symmetric
% regW = regW.*full(reg);
% regW_str = sum(regW,2);
% [~, cumstr, ~] = cumulativedist(regW_str,vertices);
% figure;bar(cumstr);
% saveas(gcf,'results/reg/reg_cumstr.png');
% regW_mean = mean(regW_str);
% 
% % average path length
% avgPath_reg = ave_path_length(reg);
% allPaths = all_shortest_paths(reg);
% avgPath_reg_var = var(allPaths(:));
% 
% % clustering
% clust_reg = clustering_coefficients(reg);
% clust_reg_mean = mean(clust_reg);
% [clust_reg_cum,~] = cumulative(clust_reg);
% figure;plot([clust_reg(1) clust_reg(2)],[0 clust_reg_cum])
% saveas(gcf,'results/reg/reg_clust.png');
% 
% % centrality
% degree_reg = reg_deg/(vertices-1);
% degree_reg_mean = mean(degree_reg);
% [degree_reg_cum,~] = cumulative(degree_reg);
% figure;plot([degree_reg(1) degree_reg(2)],[0 degree_reg_cum])
% saveas(gcf,'results/reg/reg_deg_cent.png');
% 
% closeness_reg = closeness(reg);
% closeness_reg_mean = mean(closeness_reg);
% [closeness_reg_cum,~] = cumulative(closeness_reg);
% figure;plot([closeness_reg(1) closeness_reg(2)],[0 closeness_reg_cum])
% saveas(gcf,'results/reg/reg_clos_cent.png');
% 
% eigen_reg = eigencentrality(full(reg));
% eigen_reg_mean = mean(eigen_reg);
% [eigen_reg_cum,x] = cumulative(eigen_reg);
% figure;plot(x,eigen_reg_cum);
% saveas(gcf,'results/reg/reg_eig_cent.png');
% 
% betweenness_reg = node_betweenness_faster(reg);
% betweenness_reg_mean = mean(betweenness_reg);
% [betweenness_reg_cum,x] = cumulative(betweenness_reg);
% figure;plot(x,betweenness_reg_cum);
% saveas(gcf,'results/reg/reg_bet_cent.png')
% 
% save('results/reg/reg_workspace');
