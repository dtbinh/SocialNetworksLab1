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