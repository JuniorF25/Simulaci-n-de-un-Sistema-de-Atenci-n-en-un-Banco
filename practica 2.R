##matriz de 2*2
#+++++procedimiento  para determinar principal
vp=c(2,4,3,-4)
mp=matrix(vp,2,byrow=TRUE)
dp=det(mp)

#+++++procedimiento para determinante de x
vx=c(2,4,1,-4)
mx=matrix(vx,2,byrow=TRUE)
dx=det(mx)
dx

#++++++procedimirnto para determinante de y
vy=c(2,2,3,1)
my=matrix(vy,2,byrow=TRUE)
dy=det(my)

#+++++respuestas finales 
x=dx/dp
y=dy/dx

###matriz nueva
# Definir la matriz de coeficientes (A)
A <- matrix(c(1, -4, 5, 1), 2, byrow = TRUE)

# Definir el vector de términos independientes (B)
B <- c(1, 8)

# Determinante de A
det_A <- det(A)

# Construcción de la matriz para x (Ax)
Ax <- A
Ax[,1] <- B  # Reemplazar la primera columna con el vector B
det_Ax <- det(Ax)

# Construcción de la matriz para y (Ay)
Ay <- A
Ay[,2] <- B  # Reemplazar la segunda columna con el vector B
det_Ay <- det(Ay)

# Cálculo de las soluciones usando la Regla de Cramer
x <- det_Ax / det_A
y <- det_Ay / det_A

# Imprimir los resultados
cat("El valor de x es:", x, "\n")
cat("El valor de y es:", y, "\n")

#matriz de 3*3
#++determinate principal
vp=c(2,1,-3,5,-4,1,1,-1,-4)
mp=matrix(vp,3,byrow=TRUE)
dp=det(mp)
dp

#determinante x
vx=c(7,1,-3,-19,-4,1,4,-1,-4)
mp=matrix(vx,3,byrow=TRUE)
dx=det(mx)

#determinante y
vy=c(2,7,-3,5,-19,1,1,4,-4)
my=matrix(vy,3,byrow=TRUE)
dy=det(my)

#determinate z
vz=c(2,1,7,5,-4,-19,1,-1,4)
mz=matrix(vz,3,byrow=TRUE)
dz=det(mz)

x=dx/dp
y=dy/dp