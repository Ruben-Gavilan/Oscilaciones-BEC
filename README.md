# Oscilaciones-BEC
Repositorio con los programas pertinentes para la simulación de un condensado de Bose-Einstein bidimensional mediante los siguientes métodos numéricos:
- Split-Step
- Split-Step Simetrizado
- Operadores simplécticos de orden 4
- Runge-Kutta de orden 4 en imagen de interacción
  
La simulación de un BEC se ha realizado con dos implementaciones diferentes:
- Cálculo de errores del método RK4IP
- Confirmación de las oscilaciones de forma mediante todos los métodos previamente mencionados

## Modo de empleo:
Copiar el repositorio en tu equipo, ya sea clonando el repositorio entero mediante `git clone enlace`, o descargando las carpetas manualmente. Seguidamente ejecutar el programa principal situado en el directorio de la implementación concreta que se quiera realizar, por ejemplo:
Para realizar el cálculo de errores abrir el directorio "Calculo_Error" y ejecutar el programa principal "Principal.jl" mediante el intérprete de Julia, es decir:
`julia> include("Principal.jl")`
