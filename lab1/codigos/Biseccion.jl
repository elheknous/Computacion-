function biseccion(f :: Function, a:: Number, b:: Number, error :: AbstractFloat = 1e-5, iter::Int64 = 100) ## Funcion que recibe como parametros la ecuacion no linel, el intervalo de interes, la tolerancia, y la cantidad maxima de iteraciones 
    MaximoError = (b-a)/2 # Forma del error en el metodo de biseccion (Xnueva - Xanterior)/Xnueva

    n = 0 # cantidad de iteraciones

    while MaximoError > error || n > iter  # Ciclo que desarrolla el metodo de biseccion que se detiene al momemento de que la tolerancia supere al error maximo o se supere el numero de iteraciones
        puntoMedio = (a+b)/2 # Punto medio del intervalo
        if (f(a) * f(puntoMedio) < 0) # Comprueba el signo del producto de las imagenes del punto medio y los extremos donde se cambia el intervalo segun corresponda
            b = puntoMedio
        else
            a = puntoMedio
        end
        MaximoError = (b-a)/2 # El nuevo error que se generara con el intervalo modificado 
        println([puntoMedio, MaximoError]) # Muestra las soluciones de cada interacion junto con el erro que se comete en cada una de ellas 
        n = n +1

    end
end

biseccion(x -> exp(x) - sin(3*x) -2, 0,1)
