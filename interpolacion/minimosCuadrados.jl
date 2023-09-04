θ = π/7; a = 2; b = 1.5; x_0 = 3; y_0 = -1;
fx(t) = a*cos(θ)*cos(t) - b*sin(θ)*sin(t) + x_0
fy(t) = a*sin(θ)*sin(t) + b*cos(θ)*cos(t) + y_0

N = 200;
ts = LinRange(0,2π,N);
x = fx.(ts) + randn(N)*0.1;
y = fy.(ts) + randn(N)*0.1;

A = [x.^2 y.^2 x.*y x y ]
p = A\ones(N)

using Plots
X = LinRange(minimum(x),maximum(x),100)
Y = LinRange(minimum(y),maximum(y),100)
F = Array{Float64}(undef,100,100)
for i ∈ 1:100, j ∈ 1:100
    F[i,j] = p[1]*X[i]^2 + p[2]*Y[j]^2 + p[3]*X[i]*Y[j] + p[4]*X[i] + p[5]*Y[j]
end

plot(x,y,seriestype = :scatter, label="Observations", legend=:topleft)
plot!(fx.(ts), fy.(ts), linewidth=3, label="True Ellipse")
contour!(X, Y, F, linewidth=3, levels=[1], color=:green)
plot!([], color=:green, label="Fitted Ellipse")