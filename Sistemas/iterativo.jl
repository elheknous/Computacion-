using IterativeSolvers
using LinearMaps
iter_A(x) = [ -2x[1] + x[2]; x[1:end-2] - 2x[2:end-1] + x[3:end] ; -2x[end] + x[end-1] ]

xt = rand(m);
norm(iter_A(xt)-A*xt)

Ax = LinearMap(x->iter_A(x),m,m)

x_gmres = gmres(Ax,F,reltol=1e-8,restart=m) #se resuelce el sistema

i = [2 6 1;1 2 -1 ;5 7 -4] #matriz del sistema
b = [7 ; -1 ;9] 

x_gmres = gmres(i,b,reltol=1e-8,restart=m)

norm(x_gmres-u)
