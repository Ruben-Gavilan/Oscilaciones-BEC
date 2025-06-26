# Script principal para la evolución temporal de un BEC bidimensional

using FFTW
using Plots
using ColorSchemes
using Trapz

include("Input/Entrada.jl") # Se cargan los datos iniciales

#include("Funciones/Split_Step.jl") # Se realiza la propagación mediante Split-Step
#include("Funciones/SSS.jl") # Mediante Split-Step-Simetrico
#include("Funciones/Yoshida.jl") # Mediante Operadores simplécticos de orden 4
include("Funciones/RK4IP.jl");

include("Funciones/guardar.jl")

include("Funciones/ploteo.jl") # Se representan los resultados
