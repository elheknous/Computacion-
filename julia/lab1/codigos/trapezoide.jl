using Printf
using Plots


function quad_trap(f,a,b,N)  #metodo del quad
    h = (b-a)/N
    int = h * ( f(a) + f(b) ) / 2
    for k=1:N-1
        xk = (b-a) * k/N + a
        int = int + h*f(xk)
    end
    return int
end

f(x) = exp(cos(x)^3) #Funcion
@time ref = quad_trap(f,0,2π,10000);
ref
for n=2:5
    error = abs(quad_trap(f,0,2π,2^n) - ref)
    @printf("n=%3i, %4.2e\n", 2^n,error)
end

x_true = LinRange(0,2π,1600)
x_trap = LinRange(0,2π,16)
plot(x_trap,f.(x_trap),fillrange=0,label="Trapezoidal rule")
plot!(x_true,f.(x_true),line=4,legend=:bottomright,label="Function values")