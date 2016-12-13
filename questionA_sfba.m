clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';
%% SF(BA)
sfba = pref(vertices, 4);
G.Adj = full(sfba);
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';
G.nv = vertices;
G.ne = sum(sum(full(sfba)))/2;
sfba_deg = sum(full(sfba));
sfba_deg = sfba_deg';

plotGraphBasic(G, markerSize, addText);
saveas(gcf,'./images/sfba_plot.png');
[~, cumdist, dist] = cumulativedist(sfba_deg,190);
figure;bar(dist);
saveas(gcf,'./images/sfba_deg.png');
figure;bar(cumdist);
saveas(gcf,'./images/sfba_cumdist.png');
sf_mean = mean(sfba_deg);
sf_std = std(sfba_deg);

				%weighted
sfW = 10*rand(vertices);
sfW = sfW.*full(sfba);
sfW_str = sum(sfW);
[~, cumstr, ~] = cumulativedist(sfW_str,190);
saveas(gcf,'./images/sfba_cumstr.png');
figure;bar(cumstr);
sfW_mean = mean(sfW_str);

%% average path length
avgPath_sfba = ave_path_length(sfba);
c = all_shortest_paths(sfba);
var_sfba = var(c(:));

%%clustering coefficients
[~,cc_sfba] = clustering_coefficients(sfba);
cc_sfba = cc_sfba';
figure;
[y,x] = cumulative(cc_sfba,190);
saveas(gcf,'./images/sfba_ccdist.png');
cc_avg=sum(cc_sfba)/190;

%%centrality
figure;
[~,ccent] = cumulativecentrality(sfba_deg,190);
bar(ccent);
saveas(gcf,'./images/sfba_dcent.png');
deg_cent_avg = sum(sfba_deg)/190;

%%closeness
clos_cent = closeness(sfba);
clos_cent_avg = sum(clos_cent/190);
figure;
[y,x] = cumulative(clos_cent);
plot(x,y);
saveas(gcf,'./images/sfba_ccent.png');

%%betweeness
bet_cent = node_betweenness_faster(sfba);
bet_cent_avg = sum(bet_cent)/190;
figure;
[y,x] = cumulative(bet_cent);
plot(x,y);
saveas(gcf,'./images/sfba_bcent.png');

%%eigencentrality
eigen_cent = eigencentrality(sfba)
eigen_cent_avg = sum(eigen_cent)/190;
figure;
[y,x] = cumulative(eigen_cent);
plot(x,y);
saveas(gcf,'./images/sfba_ecent.png');
