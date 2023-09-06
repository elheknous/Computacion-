function biseccion(f :: Function, a:: Number, b:: Number, error :: AbstractFloat = 1e-5, iter::Int64 = 100)
    MaximoError = (b-a)/2
    n = 0
    while MaximoError > error || n > iter
        puntoMedio = (a+b)/2
        if (f(a) * f(puntoMedio) < 0)
            b = puntoMedio
        else
            a = puntoMedio
        end
        MaximoError = (b-a)/2
        println(puntoMedio)
        n = n +1

    end
end

biseccion(x -> exp(x) - sin(3*x) -2, 0,1)
