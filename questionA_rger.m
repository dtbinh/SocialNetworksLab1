clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

%% RG(ER)
rg = erdrey(vertices, 750);
G.Adj = full(rg);
G.nv = vertices;
G.ne = sum(sum(full(rg)))/2;
rg_deg = sum(full(rg));
rg_deg = rg_deg';

plotGraphBasic(G, markerSize, addText);
saveas(gcf,'./images/rger_plot.png')
[~, cumdist, dist] = cumulativedist(rg_deg,190);
figure;bar(dist);
saveas(gcf,'./images/rger_deg.png')
figure;bar(cumdist);
saveas(gcf,'./images/rger_cumdist.png')
rg_mean = mean(rg_deg);
rg_std = std(rg_deg);

%weighted
rgW = 10*rand(vertices);
rgW = rgW.*full(rg);
rgW_str = sum(rgW);
[~, cumstr, ~] = cumulativedist(rgW_str,190);
saveas(gcf,'./images/rger_cumstr.png')
figure;bar(cumstr);
rgW_mean = mean(rgW_str);

% average path length
avgPath_rg = ave_path_length(rg);

%clustering coefficients
cc_rger = clustering_coefficients(rgg);
figure;
continuous_cumulative_dist(cc_rger',190);
saveas(gcf,'./images/rger_ccdist.png')
cc_avg=sum(cc_rger)/190;

%centrality
figure;
[~,ccent] = cumulativecentrality(rger_deg,190);
bar(ccent);
saveas(gcf,'./images/rger_ccent.png');

deg_cent = sum(rger_deg)/190;
clos_cent = sum(closeness(rger))/190;
bet_cent = sum(node_betweenness_faster(rger))/190;
eigen_cent = sum(eigencentrality(rger))/190;
