clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

%% REG
reg = smallw(vertices, 2, 1); %% gia vathmo 4
G.Adj = full(reg);
G.nv = vertices;
G.ne = sum(sum(full(reg)))/2;
reg_deg = sum(full(reg));
reg_deg = reg_deg';

%%plotGraphBasic(G, markerSize,addText);
%%saveas(gcf,'./images/reg_plot.png');
[~, cumdist, dist] = cumulativedist(reg_deg,190);
figure;bar(dist);
saveas(gcf,'./images/reg_deg.png');
figure;bar(cumdist);
saveas(gcf,'./images/reg_cumdist.png');
reg_mean = mean(reg_deg);
reg_std = std(reg_deg);

%%weighted
regW = 10*rand(vertices);
regW = regW.*full(reg);
regW_str = sum(regW);
[~, cumstr, ~] = cumulativedist(regW_str,190);
figure;bar(cumstr);
saveas(gcf,'./images/reg_cumstr.png');
regW_mean = mean(regW_str);

%% average path length
avgPath_reg = ave_path_length(reg);

%%clustering coefficients
[~,cc_reg] = clustering_coefficients(reg);
cc_reg = cc_reg';
figure;
[y,x] = cumulative(cc_reg,190);
saveas(gcf,'./images/reg_ccdist.png');
cc_avg=sum(cc_reg)/190;

%%centrality
figure;
[~,ccent] = cumulativecentrality(reg_deg,190);
bar(ccent);
saveas(gcf,'./images/reg_dcent.png');
deg_cent_avg = sum(reg_deg)/190;

%%closeness
clos_cent = closeness(reg);
clos_cent_avg = sum(clos_cent/190);
figure;
[y,x] = cumulative(clos_cent);
plot(x,y);
saveas(gcf,'./images/reg_ccent.png');

%%betweeness
bet_cent = node_betweenness_faster(reg);
bet_cent_avg = sum(bet_cent)/190;
figure;
[y,x] = cumulative(bet_cent);
plot(x,y);
saveas(gcf,'./images/reg_bcent.png');

%%eigencentrality
eigen_cent = eigencentrality(reg)
eigen_cent_avg = sum(eigen_cent)/190;
figure;
[y,x] = cumulative(eigen_cent);
plot(x,y);
saveas(gcf,'./images/reg_ecent.png');
