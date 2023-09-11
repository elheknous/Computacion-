function main()
    f(x) = x^2
    g(x) = x^4
    h(x) = (x+1)^(-1)

    a = 0
    b = 2
    n = 4

    println(sinson(f,a,b,n))

    x_true = LinRange(0,2,100)
    x_trap = LinRange(0,2,10)

    plot(x_trap,g.(x_trap),fillrange=0,label="Integracion")
    plot!(x_true,g.(x_true),line=4,legend=:bottomright,label="Function values")
end

function sinson(df,a,b,n)
    h = (b-a)/n
    xi0 = df(a) + df(b)
    xi1 = 0
    xi2 = 0

    for i in 1:n-1
        x = a + i*h
        if i%2 == 0
            xi2 += df(x)
        else
            xi1 += df(x)
        end
    end

    xi = h*(xi0 + 2*xi2 + 4*xi1)/3

    
    return xi


end

main()