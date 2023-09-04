# Problem definition
α = 1;
β = 1;
f(x) = exp(x)

# Create uniform mesh
m = 1000;                     # Select a value
h = 1/(m+1);                  # Spacing between nodes
x = LinRange(0,1,m+2)         # Note: m+2 because LinRange includes boundaries
x_inner = x[2:m+1];           # Inner nodes where we will solve the equations

# Function to fill values of tridiagonal matrix
function fillmat!(A)
    for i=1:m
      A[i,i] = -2                 # Diagonal
      if i<m
        A[i,i+1] = 1              # Sup-diagonal
      end
      if i>1
        A[i,i-1] = 1              # Sub-diagonal
      end
    end
  end
  
  # Create Undefined Matrix and fill values
  A = zeros(m,m)
  fillmat!(A) #Se llama a la funcion para rellenar
    
  # Create Right-hand side  
  F = Array{Float64}(undef,m)  
  for i=1:m
    F[i] = h^2 * f(x_inner[i])
  end
  F[1] = F[1] - α
  F[m] = F[m] - β

  i = [2 6 1;1 2 -1 ;5 7 -4]
  b = [7 ; -1 ;9]
  l = i\b


  u = A\F # Aqui se resulve el sistema