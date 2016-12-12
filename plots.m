

function plots()
    global vert;
    vert = 190;
   rgg_plot()
end

function rg_plot()
    vert = getGlobalvert;
    M = 750;
    rg = erdrey(190,750);
    G.Adj=full(rg);
    G.nv=vert;
    G.ne = sum(sum(G.Adj))/2;
    [x,y]= getNodeCoordinates(vert);
    G.x=x';
    G.y=y';
    plotGraphBasic(G,12,1)
end

function rgg_plot()
    coords = randi(1000,[vert 2]);
    [mat,node] = rgg(coords,vert,250);
    G.Adj=full(mat);
    G.nv=vert;
    G.ne=sum(sum(G.Adj))/2;
    [x,y]= getNodeCoordinates(vert);
    G.x=x';
    plotGraphBasic(G,12,1)
    G.y=y';
end



   