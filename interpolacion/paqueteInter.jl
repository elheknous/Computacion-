import Pkg; Pkg.add("Interpolations")
using Interpolations
using Plots

# Example data to interpolate
x = LinRange(0,π,5)
y = sin.(x)

# Build Interpolation functions
linear_spline = LinearInterpolation(x, y, extrapolation_bc = Line() )
cubic_spline = CubicSplineInterpolation(x, y, extrapolation_bc = Line())

# Evaluate interpolants and plot results
plot(x,y,marker=5,linetype=:scatter, label = "Data", title = "Piecewise Interpolation Test")

x_ext = LinRange(-0.1,π+1.5,100)
plot!(x_ext, sin.(x_ext), label="Actual Function")
plot!(x_ext,linear_spline(x_ext), label="Linear Spline")
plot!(x_ext,cubic_spline(x_ext), label="Cubic Spline")