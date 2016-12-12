clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

%% SW(WS)
sw = smallw(vertices, 2, 0.3);
G.Adj = full(sw);
G.nv = vertices;
G.ne = sum(sum(full(sw)))/2;
reg_deg = sum(full(sw));
sw_deg = reg_deg';

plotGraphBasic(G, markerSize, addText);
saveas(gcf,'./images/swws_plot.png');
[~, cumdist, dist] = cumulativedist(sw_deg,190);
figure;bar(dist);
saveas(gcf,'./images/swws_deg.png');
figure;bar(cumdist);
saveas(gcf,'./images/swws_cumdist.png');
sw_mean = mean(sw_deg);
sw_std = std(sw_deg);

%weighted
swW = 10*rand(vertices);
swW = swW.*full(sw);
swW_str = sum(swW);
[~, cumstr, ~] = cumulativedist(swW_str,190);
saveas(gcf,'./images/swws_cumsrt.png');
figure;bar(cumstr);
swW_mean = mean(swW_str);

% average path length
avgPath_sw = ave_path_length(sw);

%clustering coefficients
cc_sw = clustering_coefficients(sw);
figure;
continuous_cumulative_dist(cc_sw',190);
saveas(gcf,'./images/sfba_ccdist.png')
cc_avg=sum(cc_sw)/190;

%centrality
figure;
[~,ccent] = cumulativecentrality(sw_deg,190);
bar(ccent);
saveas(gcf,'./images/swws_ccent.png');

deg_cent = sum(sw_deg)/190;
clos_cent = sum(closeness(sw))/190;
bet_cent = sum(node_betweenness_faster(sw))/190;
eigen_cent = sum(eigencentrality(sw))/190;


