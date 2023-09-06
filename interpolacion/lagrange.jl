function LagrangeInterp1D( fvals, xnodes, barw, t )
    numt = 0
	denomt = 0

	for j = 1 : length( xnodes )
		tdiff = t - xnodes[j]
		numt = numt + barw[j] / tdiff * fvals[j]
		denomt = denomt + barw[j] / tdiff
		
		if ( abs(tdiff) < 1e-15 )
			numt = fvals[j]
            denomt = 1.0
            break
		end
	end

    return numt / denomt

end

# Equispaced points
EquispacedNodes(n) = [2*(j/n-0.5) for j=0:n]
EquispacedBarWeights(n) = [ (-1)^j * binomial(n,j) for j=0:n ]

# Chebyshev points of the second kind
ClosedChebNodes(n) = [cos(jπ/n) for j=0:n]
ClosedChebBarWeights(n) = [0.5; [(-1)^j for j=1:n-1]; 0.5*(-1)^n]

f(x) = 1/(1 + 16*x^2)

using Plots


# Sampling
n = 15;
xnodes = EquispacedNodes(n);
w = EquispacedBarWeights(n);
f_sample = f.(xnodes);

# Interpolation
t = LinRange(-1,1,100)
f_interp = [LagrangeInterp1D( f_sample, xnodes, w, t[j] ) for j=1:length(t)]
plot(t,f.(t), label="Exact", marker = 3)
plot!(t,f_interp, label="Interp", marker = 3)