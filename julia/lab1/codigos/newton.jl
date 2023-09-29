function newton(f :: Function, fprima :: Function, x0 :: Number,tol :: AbstractFloat = 1e-5) #parametros: fuancion, derivada, la tolerancia
    iter = 100 #Numero maximo de iteraciones
    x1 = 0 #
    error = Inf
    n = 0
    while error > tol #Ciclo que realiza el metodo iterativo
        x1 = x0 - (f(x0)/fprima(x0)) #Formula
        error = abs((x1-x0)/x1) #Calculo del error en cada iteracion
        println([x1, error])
        n = n +1
        x0 = x1 #Nuevo valor para la siguiente iteracion
        if n > iter
            break
        end     
    end

    return x1
end

#Ejemplo 1
g(x) = 6*x^3 - 8*x^2 - 10*x+3
gprima(x) = 18*x^2 - 16*x -10
newton(g,gprima,0)

#Ejemplo 2
h(x) = x^x - 100
hprima(x) = x^x*(1+log(x))
newton(h,hprima,3.5)

#Ejemplo 3
f(x) = exp(x) - sin(3*x) -2
fprima(x) = exp(x) - 3*cos(3*x)
newton(f,fprima,0.5)







