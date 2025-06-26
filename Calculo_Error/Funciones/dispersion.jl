# Función para implementar el operador dispersión en 2D para un condensado de Bose-Einstein
# ------------------------------------INPUT------------------------------------------------
# f:		Función de onda del Condensado (matriz)
# w:		vector de frecuencias del dominio de Fourier (vector)
# N:		Número de puntos espaciales en ambas direcciones (escalar)
# k:		Tamaño del paso temporal (escalar)
# ep:		Parámetro epsilon de la ecuación de Gross-Pitaevskii.
# ------------------------------------OUTPUT-----------------------------------------------
# g:		Función de onda del condensado tras aplicar dispersión (matriz)
function eD(f,w,N,k,ep)

g=zeros(N,N) .+0im;
for dx=1:N
	g[dx,:]=ifft(exp.(-0.5im*0.5*k*ep*w.^2).*fft(f[dx,:]));
end
for dy=1:N
	g[:,dy]=ifft(exp.(-0.5im*0.5*k*ep*w.^2).*fft(g[:,dy]));
end

return g
end
