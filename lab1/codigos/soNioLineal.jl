function biseccion(f :: Function, a:: Number, b:: Number, error :: AbstractFloat = 1e-5, iter::Int64 = 100)
puntoMedio(x,y) = (x+y)/2
[f(puntoMedio(a,b)) < 0 ? a = puntoMedio(a,b) : b = puntoMedio(a,b)
for i in 1 : iter if (b-a)/2 > error]
end

biseccion(x -> exp(x) - sin(3*x) -2, 0,1)
