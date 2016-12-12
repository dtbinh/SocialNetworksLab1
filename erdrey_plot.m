vert = 190;
M = 750;
rg = erdrey(100,750);
G.Adj=full(rg);
G.nv=vert;
G.ne = sum(sum(G.Adj))/2;
[x,y]=getNodeCoordinates(vert)
G.x=x';
G.y=y';
plotGraphBasic(G,12,1);