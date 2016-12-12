clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';
%% SF(BA)
sf = pref(vertices, 4);
G.Adj = full(sf);
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';
G.nv = vertices;
G.ne = sum(sum(full(sf)))/2;
sf_deg = sum(full(sf));
sf_deg = sf_deg';

plotGraphBasic(G, markerSize, addText);
saveas(gcf,'./images/sfba_plot.png');
[~, cumdist, dist] = cumulativedist(sf_deg,190);
figure;bar(dist);
saveas(gcf,'./images/sfba_deg.png');
figure;bar(cumdist);
saveas(gcf,'./images/sfba_cumdist.png');
sf_mean = mean(sf_deg);
sf_std = std(sf_deg);

%weighted
sfW = 10*rand(vertices);
sfW = sfW.*full(sf);
sfW_str = sum(sfW);
[~, cumstr, ~] = cumulativedist(sfW_str,190);
saveas(gcf,'./images/sfba_cumstr.png');
figure;bar(cumstr);
sfW_mean = mean(sfW_str);

% average path length
avgPath_sf = ave_path_length(sf);

%clustering coefficients
cc_sf = clustering_coefficients(sf);
figure;
continuous_cumulative_dist(cc_sf',190);
saveas(gcf,'./images/sfba_ccdist.png')
cc_avg=sum(cc_sf)/190;

%centrality
figure;
[~,ccent] = cumulativecentrality(sf_deg,190);
bar(ccent);
saveas(gcf,'./images/sfba_ccent.png');

deg_cent = sum(sf_deg)/190;
clos_cent = sum(closeness(sf))/190;
bet_cent = sum(node_betweenness_faster(sf))/190;
eigen_cent = sum(eigencentrality(sf))/190;