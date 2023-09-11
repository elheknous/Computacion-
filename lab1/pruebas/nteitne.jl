function integral_simpson(fun,x,n)
   
    a = x[1]
    b = x[2]
    
    h = (b-a)/n
    i = collect(range(0,stop=n,length=n+1))
    x = a*ones(n+1) + i*h
    
    y = map(fun, x)
    
    return h/3 * (2.0 * dot((ones(length(y)-2)+rem.(1:length(y)-2,2)),(y[2:(length(y)-1)])) +y[1]+y[length(y)])
end

f(x)=2*x
int_res = integral_simpson(f,[0,1],10)