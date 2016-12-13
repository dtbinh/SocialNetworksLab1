function per= question_h()

per_reg = conper_reg();
figure;
plot([2:2:10],per_reg);
saveas(gcf,'./images/reg_con.png');

per_errg = conper_errg();
figure;
plot([100:100:800],per_errg);
saveas(gcf,'./images/errg_con.png');

per_rgg = conper_rgg();
figure;
plot([25:25:250],per_rgg);
saveas(gcf,'./images/rgg_con.png');

per_basf = conper_basf();
figure;
plot([2:2:10],per_basf);
saveas(gcf,'./images/basf_con.png');

per_wssw = conper_wssw();
figure;
for i =1:5
plot([0.1:0.1:0.7],per_wssw(i,:));

end
legend('d=2','d=4','d=6','d=8','d=10');
saveas(gcf,'./images/wssw_con.png');
end

function  per = conper_reg()
n = 100;
count=1;
con = 0;
for d = 2:2:10
    
    for i = 1:100
        A = smallw(n,d,0.1);
        if isconnected(A)
            con=con+1;
        end
    end
    per(count) = con/100;
    count=count+1;
    con = 0;
end
end

function per = conper_errg()
n=100;
count=1;
con = 0;
for M = 100:100:800
    for i = 1:100
    A = erdrey(n,M);   
    if isconnected(A)
        con=con+1;
    end
    per(count) =con/100;
    end
    count=count+1;
    con = 0;
end
end

function per = conper_rgg()
n=100;
count=1;
con = 0;
for R = 25:25:250
    for i=1:100
    coords = randi(1000,[n 2]);
    [A,~] = rgg(coords,n,R);
  
    if isconnected(A)
        con=con+1;
    end
    end
    per(count)=con/100;
    count=count+1;
    con = 0;
end
end

function per = conper_basf()
n=100;
count_1=1;
for d =2:2:10
    con = 0;
    for i=1:100
    A = pref(n,d);
    if isconnected(A)
        con=con+1;
    end
    end
    per(count_1)=con/100;
    count_1=count_1+1;
end
end

function per = conper_wssw()
n=100;
count_1=1;
count_2=1;
for d =2:2:10
    count_2=1;
    for g=0.1:0.1:0.7
        con=0;
        for i=1:100
            A = smallw(n,d,g);
            if isconnected(A)
                con=con+1;
            end
        end
        per(count_1,count_2)=con/100;
        count_2=count_2+1;
    end
    count_1=count_1+1;
end
end
