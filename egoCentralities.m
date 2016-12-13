%% ego-centralities

clear;
vertices = 190;
load('./images/reg.mat')
load('./images/rgg.mat')
load('./images/rger.mat')
load('./images/sfba.mat')
load('./images/swws.mat')

reg_ego_net = ego_network(reg);
rgg_ego_net = ego_network(rgg);
er_ego_net = ego_network(rger);
sf_ego_net = ego_network(sfba);
sw_ego_net = ego_network(swws);

reg_ego_cent = zeros(vertices,1);
rgg_ego_cent = zeros(vertices,1);
er_ego_cent = zeros(vertices,1);
sf_ego_cent = zeros(vertices,1);
sw_ego_cent = zeros(vertices,1);

for node = 1:vertices
    
    f = strcat('n',num2str(node));
    field = strcat('ego',num2str(node));
    
    reg_ego_net.(field) = (reg_ego_net.(f)^2)*(1-reg_ego_net.(f));
    reg_ego_cent(node) = reciprocalSum(reg_ego_net.(field));
    
    rgg_ego_net.(field) = (rgg_ego_net.(f)^2)*(1-rgg_ego_net.(f));
    rgg_ego_cent(node) = reciprocalSum(rgg_ego_net.(field));
    
    er_ego_net.(field) = (er_ego_net.(f)^2)*(1-er_ego_net.(f));
    er_ego_cent(node) = reciprocalSum(er_ego_net.(field));
    
    sf_ego_net.(field) = (sf_ego_net.(f)^2)*(1-sf_ego_net.(f));
    sf_ego_cent(node) = reciprocalSum(sf_ego_net.(field));
    
    sw_ego_net.(field) = (sw_ego_net.(f)^2)*(1-sw_ego_net.(f));
    sw_ego_cent(node) = reciprocalSum(sw_ego_net.(field));   
end
save('./images/egocents');


