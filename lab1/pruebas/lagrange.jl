function lagrange(x,y,xs)
n = length(x);
l = [];
c = 1:n;

for i in 1:n
    prod = 1

    for j in c 
        prod = prod*(xs-x[j])/(x[j]-x[j])
    end
    l=[l,prod]
end

z = sum(y*l)
end

x = [1,1.2,1.6,2,2.5]
y = [4,4.5,5,7.4,8]

p = LinRange(1, 2.5, 100)

yp=[]
for i in 1:length(p)
    yp = [yp,lagrange(x,y,p[i])]
end
