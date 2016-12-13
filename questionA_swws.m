clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

%% SW(WS)
swws = smallw(vertices, 2, 0.3);
G.Adj = full(swws);
G.nv = vertices;
G.ne = sum(sum(full(swws)))/2;
reg_deg = sum(full(swws));
sw_deg = reg_deg';

plotGraphBasic(G, markerSize, addText);
saveas(gcf,'./images/swws_plot.png');
[~, cumdist, dist] = cumulativedist(swws_deg,190);
figure;bar(dist);
saveas(gcf,'./images/swws_deg.png');
figure;bar(cumdist);
saveas(gcf,'./images/swws_cumdist.png');
sw_mean = mean(swws_deg);
sw_std = std(swws_deg);

				%weighted
swW = 10*rand(vertices);
swW = swW.*full(swws);
swW_str = sum(swW);
[~, cumstr, ~] = cumulativedist(swW_str,190);
saveas(gcf,'./images/swws_cumsrt.png');
figure;bar(cumstr);
swW_mean = mean(swW_str);

%% average path length
avgPath_swws = ave_path_length(swws);
c = all_shortest_paths(swws);
var_swws = var(c(:));

%%clustering coefficients
[~,cc_swws] = clustering_coefficients(swws);
cc_swws = cc_swws';
figure;
[y,x] = cumulative(cc_swws,190);
saveas(gcf,'./images/swws_ccdist.png');
cc_avg=sum(cc_swws)/190;

%%centrality
figure;
[~,ccent] = cumulativecentrality(swws_deg,190);
bar(ccent);
saveas(gcf,'./images/swws_dcent.png');
deg_cent_avg = sum(swws_deg)/190;

%%closeness
clos_cent = closeness(swws);
clos_cent_avg = sum(clos_cent/190);
figure;
[y,x] = cumulative(clos_cent);
plot(x,y);
saveas(gcf,'./images/swws_ccent.png');

%%betweeness
bet_cent = node_betweenness_faster(swws);
bet_cent_avg = sum(bet_cent)/190;
figure;
[y,x] = cumulative(bet_cent);
plot(x,y);
saveas(gcf,'./images/swws_bcent.png');

%%eigencentrality
eigen_cent = eigencentrality(swws)
eigen_cent_avg = sum(eigen_cent)/190;
figure;
[y,x] = cumulative(eigen_cent);
plot(x,y);
saveas(gcf,'./images/swws_ecent.png');
