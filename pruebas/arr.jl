a = [5,3,4,4]
x = sum(a)

v = [n*2 for n in a]
sum(v)

primeros100 = [n for n in 1:100]

function sum_zeta(exponente, cantidad)
    x=0
    for n in 1:cantidad
        x = x + (1/n)^exponente
    end
    return x
end

l = sum_zeta(2,100000)
