x=0
for k in 1:100000
    x = x + (1/k)^2
end

x

a = 1/2
typeof(a)

a=2^63

for i in 1:3
    for j in 1:3
        print("i=", i, " j=", j, "\n")
    end
end