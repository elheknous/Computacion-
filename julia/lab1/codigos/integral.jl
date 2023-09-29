using Plots
function sinson(df,a,b,n) #parametros: funcion, limite inferior y superior, "n de rectangulos"
    h = (b-a)/n #distancia/delta x
    xi0 = df(a) + df(b) # suma de las imagenes de los limites
    xi1 = 0 # Contiene la suma cuando el coeficiente es impar
    xi2 = 0 # Contiene la suma cuando el coeficiente es par
    for i in 1:n-1
        x = a + i*h # Siguiente punto a evaluar
        if i%2 == 0 
            xi2 += df(x) #coeficiente par
        else
            xi1 += df(x) #coeficiente impar
        end
    end
    xi = h*(xi0 + 2*xi2 + 4*xi1)/3 #Area
    return xi
end
function grafica(df,a,b) # Graficas
    x_true = LinRange(a,b,100) 
    x_trap = LinRange(a,b,10)

    plot(x_trap,df.(x_trap),fillrange=0,label="Integral") #Integral
    plot!(x_true,df.(x_true),line=4,legend=:bottomright,label="Function values") #Valores de la funcion
    
end

#Ejemplo1
g(x) = (x^3)/sqrt(1+x) #1,2,8
sinson(g,1,2,8)
grafica(g,1,2)

#Ejemplo2
l(x) = exp(x^2) #0,1,10
sinson(l,0,1,10)

#Ejemplo2
d(x) = exp(cos(x)^3)
sinson(d,0,2pi,10000)


