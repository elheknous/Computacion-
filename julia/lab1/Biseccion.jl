function biseccion(f :: Function, a:: Number, b:: Number, tol :: AbstractFloat = 1e-5) #parametros: ecuacion no linel, el intervalo, la tolerancia y la cantidad maxima de iteraciones 
    puntoMedio = 0
    iter = 100
    error = (b-a)/2 # Forma del error en el metodo de biseccion (Xnueva - Xanterior)/Xnueva
    n = 0 # cantidad de iteraciones

    while error > tol  # ciclo que se detiene al momemento de que la tolerancia supere al error maximo
        puntoMedio = (a+b)/2 # Punto medio del intervalo
        if (f(a) * f(puntoMedio) < 0) # Comprueba el signo del producto de las imagenes del punto medio y los extremos donde se cambia el intervalo segun corresponda
            b = puntoMedio
        else
            a = puntoMedio
        end
        error = (b-a)/2 # El nuevo error que se generara con el intervalo modificado 
        n = n +1
        println([puntoMedio, error]) # Muestra las soluciones de cada interacion junto con el error que se comete en cada una de ellas 
        if n > iter #if que termina el ciclo en caso de superar las iteraciones deseadas
            break
        end 
    end
    return puntoMedio
end

#Ejemplo 1
biseccion(x -> exp(x) - sin(3*x) -2, 0,1)
