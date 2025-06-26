# Aplicación de Runge-Kutta de orden 4 en IP para la evolución temporal de un BEC bidimensional
# Se debe haber ejecutado previamente el script de entrada
# Necesita los siguientes paquetes: FFTW

# Inicializamos los vectores de las direcciones RK
k1=zeros(N,N) .+ 0im;
k2=zeros(N,N) .+ 0im;
k3=zeros(N,N) .+ 0im;
k4=zeros(N,N) .+ 0im;

# Inicializamos la función de onda en imagen de interacción
fI=zeros(N,N) .+ 0im;

# Definimos el operador no lineal, para limpiar el código
NL(f)= -1im.*(0.5.*(x.^2 .+ (gamma.*y).^2) .+ kappa.*abs2.(f)) .*f ./ep;
include("dispersion.jl");
# Por compatibilidad y rendimiento, el operador dispersivo se define como función aparte.

densidad[:,:,1]=abs2.(f0);

f=copy(f0 .+ 0im);

#Comienza la propagación

tiempo=@elapsed begin # Se mide el tiempo de ejecución
for i=2:Nt

global f0; global f; global desvx; global desvy; global fI; global k1; global k2; global k3; global k4
	
	fI=eD(f,w,N,k,ep);
	k1= k .* eD(NL(f),w,N,k,ep);
	k2= k .* NL(fI .+ k1.*0.5);
	k3= k .* NL(fI .+ k2.*0.5);
	k4= k .* NL(eD(fI.+k3,w,N,k,ep));
	
	f= eD((fI .+ k1./6 .+ k2./3 .+ k3./3),w,N,k,ep) .+ k4./6;
end
densidad[:,:,2]=f;
end
