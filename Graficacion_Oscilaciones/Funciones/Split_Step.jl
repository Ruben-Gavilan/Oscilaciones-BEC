# Aplicación del método Split-Step para la evolución temporal de un BEC bidimensional
# Se debe haber ejecutado previamente el script de entrada
# Necesita los siguientes paquetes: FFTW
# ----------------------------------------------------------------------------------
# Script proporcionado por A.M. Díaz Soriano, P. Rodríguez García y M. Romero Aguilar
# ----------------------------------------------------------------------------------

global braket(xm,dens)=trapz((x,y'),xm.*abs2.(dens));


#Se alamacenan los anchos inciales de los pulsos

desvx[1]=sqrt(braket((x.-braket(x,f0)).^2,f0));
desvy[1]=sqrt(braket((y.-braket(y,f0)).^2,f0));

densidad[:,:,1]=abs2.(f0);

f=copy(f0 .+ 0im);

#Comienza la propagación

for i=2:Nt

	global f0; global f; global desvx; global desvy;
	# Se aplica el operador dispersivo
	for dx=1:N
		f[dx,:]=ifft(exp.(-0.5im*k*ep*w.^2).*fft(f[dx,:]));
	end

	for dy=1:N
		f[:,dy]=ifft(exp.(-0.5im*k*ep*w.^2).*fft(f[:,dy]));
	end
	# Se aplica el operador no lineal
	f= f.*exp.(-1im.*(0.5.*(x.^2 .+(gamma.*y).^2).+kappa.*abs2.(f)).*k./(ep));

	f0=copy(f);
        
	desvx[i]=sqrt(braket((x.-braket(x,f)).^2,f));
	desvy[i]=sqrt(braket((y.-braket(y,f)).^2,f));
	densidad[:,:,i]=abs2.(f);

end

