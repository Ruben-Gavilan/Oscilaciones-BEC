# Aplicación del método Split-Step Simétrico para la evolución temporal de un BEC bidimensional
# Se debe haber ejecutado previamente el script de entrada
# Necesita los siguientes paquetes: FFTW
# Funcionamiento: a diferencia de NLSE en esta ocasión aplicaremos dos veces el operador N,
# y una sola vez el operador D

global braket(xm,dens)=trapz((x,y'),xm.*abs2.(dens));


#Se alamacenan los anchos inciales de los pulsos

desvx[1]=sqrt(braket((x.-braket(x,f0)).^2,f0));
desvy[1]=sqrt(braket((y.-braket(y,f0)).^2,f0));

densidad[:,:,1]=abs2.(f0);

#Comienza la propagación

f=copy(f0 .+ 0im);

for i=2:Nt
	global f0; global f; global desvx; global desvy;
	# Aplicación del operador no lineal
	f= f.*exp.(-1im.*(0.5.*(x.^2 .+(gamma.*y).^2).+kappa.*abs2.(f)).*0.5.*k./(ep));
	# Aplicación del operador dispersivo
	for dx=1:N
		f[dx,:]=ifft(exp.(-0.5im*k*ep*w.^2).*fft(f[dx,:]));
	end
	for dy=1:N
		f[:,dy]=ifft(exp.(-0.5im*k*ep*w.^2).*fft(f[:,dy]));
	end
	# Segunda aplicación del operador no lineal
	f= f.*exp.(-1im.*(0.5.*(x.^2 .+(gamma.*y).^2).+kappa.*abs2.(f)).*0.5.*k./(ep));

	desvx[i]=sqrt(braket((x.-braket(x,f)).^2,f));
	desvy[i]=sqrt(braket((y.-braket(y,f)).^2,f));
	densidad[:,:,i]=abs2.(f);

end

