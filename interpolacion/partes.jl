using Interpolations #NO FUNCIONA

k = searchsortedfirst(x, t)     # Returns first k such that t <= x[k]
function LinearSpline(x,y,t)
    Y = Array{Float64}(undef,length(t))
    for i=1:length(t)
        k = searchsortedfirst(x, t[i])
        if k <= 1
            k = 2
        elseif k >= length(x)
            k = length(x) - 1
        end
        λ = ( t[i] - x[k-1] ) / ( x[k] - x[k-1])
        Y[i] =  λ * ( y[k] - y[k-1] ) + y[k-1]
    end
    return Y
end
x = LinRange(0,1,400).^2
y = sin.(3x)
t = LinRange(-0.1,1.1,6000)

itp = LinearInterpolation(x, y, extrapolation_bc = Line() )
F(t) = LinearSpline(x,y,t)

@btime itp(t)
@btime F(t)
x = LinRange(0,1,400)
y = sin.(3x)
t = LinRange(-0.1,1.1,6000)

itp = LinearInterpolation(x, y, extrapolation_bc = Line() )
F(t) = LinearSpline(x,y,t)

@btime itp(t)
@btime F(t)