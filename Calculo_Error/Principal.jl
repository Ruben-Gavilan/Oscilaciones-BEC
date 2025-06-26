# Script principal para la evolución temporal de un BEC bidimensional
# Y realizar el cálculo del error en la norma mediante RK4IP

using FFTW
using Plots
using ColorSchemes
using Trapz

# Se crea el archivo en el que guardar los errores
open("Output/Errores.txt","w") do io
	println(io, "Nt","\t","Error","\t","Tiempo");
end

# ADVERTENCIA: Se estima que este programa tarde varias horas en completar, se recomienda bajar
# considerablemente el número máximo de pasos.

for jj=1000:1000:200000
Nt=jj;
global Nt
include("Input/Entrada.jl") # Se cargan los datos iniciales

include("Funciones/RK4IP.jl");

include("Funciones/errores.jl")
end
