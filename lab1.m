%% Social Networks - Lab 1

clear;
vertices = 190;
markerSize = 8;
addText = 0;
[G.x, G.y] = getNodeCoordinates(vertices);
G.x = G.x';
G.y = G.y';

%% REG
reg = smallw(vertices, 4, 1);
G.Adj = full(reg);
G.nv = vertices;
G.ne = sum(sum(full(reg)))/2;
reg_deg = sum(full(reg));
reg_deg = reg_deg';

plotGraphBasic(G, markerSize,addText);
[~, cumdist, dist] = cumulativedist(reg_deg,190);
figure;bar(dist);
figure;bar(cumdist);
reg_mean = mean(reg_deg);
reg_std = std(reg_deg);

%weighted
regW = 10*rand(vertices);
regW = regW.*full(reg);
regW_str = sum(regW);
[~, cumstr, ~] = cumulativedist(regW_str,190);
figure;bar(cumstr);
regW_mean = mean(regW_str);

% average path length
avgPath_reg = ave_path_length(reg);

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
[~, cumdist, dist] = cumulativedist(rgg_deg,190);
figure;bar(dist);
figure;bar(cumdist);
rgg_mean = mean(rgg_deg);
rgg_std = std(rgg_deg);

%weighted
rggW = 10*rand(vertices);
rggW = rggW.*full(rgg);
rggW_str = sum(rggW);
[~, cumstr, ~] = cumulativedist(rggW_str,190);
figure;bar(cumstr);
rggW_mean = mean(rggW_str);

% average path length
avgPath_rgg = ave_path_length(rgg);

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
[~, cumdist, dist] = cumulativedist(sf_deg,190);
figure;bar(dist);
figure;bar(cumdist);
sf_mean = mean(sf_deg);
sf_std = std(sf_deg);

%weighted
sfW = 10*rand(vertices);
sfW = sfW.*full(sf);
sfW_str = sum(sfW);
[~, cumstr, ~] = cumulativedist(sfW_str,190);
figure;bar(cumstr);
sfW_mean = mean(sfW_str);

% average path length
avgPath_sf = ave_path_length(sf);

%% SW(WS)
sw = smallw(vertices, 2, 0.3);
G.Adj = full(sw);
G.nv = vertices;
G.ne = sum(sum(full(sw)))/2;
sw_deg = reg_deg';

plotGraphBasic(G, markerSize, addText);
[~, cumdist, dist] = cumulativedist(sw_deg,190);
figure;bar(dist);
figure;bar(cumdist);
sw_mean = mean(sw_deg);
sw_std = std(sw_deg);

%weighted
swW = 10*rand(vertices);
swW = swW.*full(sw);
swW_str = sum(swW);
[~, cumstr, ~] = cumulativedist(swW_str,190);
figure;bar(vertices*cumstr);
swW_mean = mean(swW_str);

% average path length
avgPath_sw = ave_path_length(sw);
