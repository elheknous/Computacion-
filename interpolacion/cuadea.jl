N = 100;
X1 = 1.0*ones(N,1) + 2*randn(N,1);
X2 = 2.0*ones(N,1) + 2*randn(N,1);
eps = randn(N,1);
y  = 3.0*ones(N,1) + 0.5*X1 +0.9*X2 + eps;

data = [y X1 X2]

#writedlm("testols.txt", data)

N = 100
y = data[:,1]
X1 = data[:,2]
X2 = data[:,3]

X = [ones(N,1) X1 X2]  # Concatenamos

beta = (X'*X)\(X'*y)   # alternativa beta = inv(X'*X)*(X'*y)

err = y - X*beta
yhat = X*beta
obs = collect(1:N)

plt_yhat = plot(obs,[y yhat], xlabel="Observación", ylabel="y", title = "Ajuste MCO", 
                  color=[:blue :red], label=["Observado" "Ajustado"], legend = true, 
                  linewidth = 2, shape = [:circle :diamond], grid = true)
display(plt_yhat)
