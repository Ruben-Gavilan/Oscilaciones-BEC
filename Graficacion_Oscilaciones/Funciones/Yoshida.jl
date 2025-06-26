# Aplicación de operadores simplécticos de orden 4 para la evolución temporal de un BEC bidimensional
# Se debe haber ejecutado previamente el script de entrada
# Necesita los siguientes paquetes: FFTW

global braket(xm,dens)=trapz((x,y'),xm.*abs2.(dens));

# Definimos los coeficientes de Yoshida

c=zeros(4);
d=zeros(3);

c[1]=1/(2*(2-(2^(1/3))));
c[4]=c[1];
c[2]=(1-(2^(1/3)))/(2*(2-(2^(1/3))));
c[3]=c[2];

d[1]=1/(2-(2^(1/3)));
d[3]=d[1];
d[2]=-(2^(1/3))/(2-(2^(1/3)));

#Se alamacenan los anchos inciales de los pulsos

desvx[1]=sqrt(braket((x.-braket(x,f0)).^2,f0));
desvy[1]=sqrt(braket((y.-braket(y,f0)).^2,f0));

densidad[:,:,1]=abs2.(f0);

f=copy(f0 .+ 0im);

#Comienza la propagación

for i=2:Nt

	global f0; global f; global desvx; global desvy;

	for sy=1:3
		f= f.*exp.(-1im.*(0.5.*(x.^2 .+(gamma.*y).^2).+kappa.*abs2.(f)).*c[sy].*k./(ep));
		
		for dx=1:N
			f[dx,:]=ifft(exp.(-0.5im*d[sy]*k*ep*w.^2).*fft(f[dx,:]));
		end
		for dy=1:N
			f[:,dy]=ifft(exp.(-0.5im*d[sy]*k*ep*w.^2).*fft(f[:,dy]));
		end
	end
	
	f= f.*exp.(-1im.*(0.5.*(x.^2 .+(gamma.*y).^2).+kappa.*abs2.(f)).*c[4].*k./(ep));
	        
	desvx[i]=sqrt(braket((x.-braket(x,f)).^2,f));
	desvy[i]=sqrt(braket((y.-braket(y,f)).^2,f));
	densidad[:,:,i]=abs2.(f);

end

