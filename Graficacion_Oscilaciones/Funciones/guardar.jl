# Script para guardar a archivos de texto los resultados obtenidos de la evolución de un BEC

# Comenzamos guardando los resultados de desviación estándar:

# Primero se crea la cabecera del archivo
open("Output/desv.txt","w") do io
	println(io,"#sigma_x","\t","sigma_y");
end


# Se imprimen los resultados
open("Output/desv.txt","a") do io
	for i=1:Nt
		println(io,desvx[i],"\t",desvy[i]);
	end
end

# Guardamos la densidad de probabilidad para distintos tiempos

# Densidad inicial ambas máximas
open("Output/F0.txt","w") do io
	for i=1:N
		println(io,densidad[i,:,1]);
	end
end

# Densidad en T=0.8s , mínima desviación en y
open("Output/F1.txt","w") do io
	for i=1:N
		println(io,densidad[i,:,1000]);
	end
end

# Densidad en T=1.6s, mínima desviación en x, casi máxima en y
open("Output/F2.txt","w") do io
	for i=1:N
		println(io,densidad[i,:,2000]);
	end
end

# Densidad en T=4s, mínima desviación en y, alta en x
open("Output/F3.txt","w") do io
	for i=1:N
		println(io,densidad[i,:,5000]);
	end
end
