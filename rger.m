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
[~, cumdist, dist] = cumulativedist(rg_deg,190);
figure;bar(dist);
figure;bar(cumdist);
rg_mean = mean(rg_deg);
rg_std = std(rg_deg);

%weighted
rgW = 10*rand(vertices);
rgW = rgW.*full(rg);
rgW_str = sum(rgW);
[~, cumstr, ~] = cumulativedist(rgW_str,190);
figure;bar(cumstr);
rgW_mean = mean(rgW_str);

% average path length
avgPath_rg = ave_path_length(rg);