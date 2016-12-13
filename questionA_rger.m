clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

%% RG(ER)
rger = erdrey(vertices, 750);
G.Adj = full(rger);
G.nv = vertices;
G.ne = sum(sum(full(rger)))/2;
rger_deg = sum(full(rger));
rger_deg = rger_deg';

plotGraphBasic(G, markerSize, addText);
saveas(gcf,'./images/rger_plot.png')
[~, cumdist, dist] = cumulativedist(rger_deg,190);
figure;bar(dist);
saveas(gcf,'./images/rger_deg.png')
figure;bar(cumdist);
saveas(gcf,'./images/rger_cumdist.png')
rg_mean = mean(rger_deg);
rg_std = std(rger_deg);

				%weighted
rgW = 10*rand(vertices);
rgW = rgW.*full(rger);
rgW_str = sum(rgW);
[~, cumstr, ~] = cumulativedist(rgW_str,190);
saveas(gcf,'./images/rger_cumstr.png')
figure;bar(cumstr);
rgW_mean = mean(rgW_str);

%% average path length
avgPath_rger = ave_path_length(rger);
c = all_shortest_paths(rger);
var_rger = var(c(:));

%%clustering coefficients
cc_rger = clustering_coefficients(rger);
cc_rger = cc_rger';
figure;
[y,x] = cumulative(cc_rger);
plot(x,y)
saveas(gcf,'./images/rger_ccdist.png');
cc_avg=sum(cc_rger)/190;

%%centrality
figure;
[~,ccent] = cumulativecentrality(rger_deg,190);
bar(ccent);
saveas(gcf,'./images/rger_dcent.png');
deg_cent_avg = sum(rger_deg)/190;

%%closeness
clos_cent = closeness(rger);
clos_cent_avg = sum(clos_cent/190);
figure;
[y,x] = cumulative(clos_cent);
plot(x,y);
saveas(gcf,'./images/rger_ccent.png');

%%betweeness
bet_cent = node_betweenness_faster(rger);
bet_cent_avg = sum(bet_cent)/190;
figure;
[y,x] = cumulative(bet_cent);
plot(x,y);
saveas(gcf,'./images/rger_bcent.png');

%%eigencentrality
eigen_cent = eigencentrality(rger);
eigen_cent_avg = sum(eigen_cent)/190;
figure;
[y,x] = cumulative(eigen_cent);
plot(x,y);
saveas(gcf,'./images/rger_ecent.png');
save('./images/rger')