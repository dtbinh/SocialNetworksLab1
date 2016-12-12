clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

%% RGG
coordinateMatrix = randi(1000, [vertices 2]);
[rgg, node_degree] = rgg(coordinateMatrix, vertices, 250);
G.Adj = full(rgg);
G.x = coordinateMatrix(:,1);
G.y = coordinateMatrix(:,2);
G.x = G.x';
G.y = G.y';
G.nv = vertices;
G.ne = sum(sum(full(rgg)))/2;
rgg_deg = sum(full(rgg));
rgg_deg = rgg_deg';

plotGraphBasic(G, markerSize, addText);
saveas(gcf,'./images/rgg_plot.png');
[~, cumdist, dist] = cumulativedist(rgg_deg,190);
figure;bar(dist);
saveas(gcf,'./images/rgg_deg.png');
figure;bar(cumdist);
saveas(gcf,'./images/rgg_cumdist.png');
rgg_mean = mean(rgg_deg);
rgg_std = std(rgg_deg);

%weighted
rggW = 10*rand(vertices);
rggW = rggW.*full(rgg);
rggW_str = sum(rggW);
[~, cumstr, ~] = cumulativedist(rggW_str,190);
figure;bar(cumstr);
saveas(gcf,'./images/rgg_cumstr.png');
rggW_mean = mean(rggW_str);

% average path length
avgPath_rgg = ave_path_length(rgg);

%clustering coefficients
cc_rgg = clustering_coefficients(sparse(rgg));
figure;
continuous_cumulative_dist(cc_rgg',190);
saveas(gcf,'./images/rgg_ccdist.png')
cc_avg=sum(cc_rgg)/190;

%centrality
figure;
[~,ccent] = cumulativecentrality(rgg_deg,190);
bar(ccent);
saveas(gcf,'./images/rgg_ccent.png');

deg_cent = sum(rgg_deg)/190;
clos_cent = sum(closeness(rgg))/190;
bet_cent = sum(node_betweenness_faster(rgg))/190;
eigen_cent = sum(eigencentrality(rgg))/190;