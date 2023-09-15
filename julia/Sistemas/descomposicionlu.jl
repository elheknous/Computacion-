using LinearAlgebra

i = [2 6 1;1 2 -1 ;5 7 -4] #matriz del sistema
b = [7 ; -1 ;9] #mateis de las soluciones

L,U,p = lu(i); # Unrolling the result

luA = lu(i);

@time begin #LU DESCOM
  x = luA\b  
end

@time begin #EL OTRO
l = i\b
end
