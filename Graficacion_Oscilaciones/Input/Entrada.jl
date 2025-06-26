# Valores y datos iniciales para la evolución de un BEC, implementado en julia
# Necesita los siguientes paquetes: FFTW
# ----------------------------------------------------------------------------
# Script proporcionado por A.M. Díaz Soriano; P. Rodríguez Garcíay M. Romero Aguilar
# ----------------------------------------------------------------------------

T=8;          #Tiempo total de simulacion
Nt=10000;     #Numero de pasos temporales
k=T/Nt;        #Paso temporal

ep=1.;        #Valor de epsilon
kappa=2.;     #Valor de K1
gamma=2.;

N=200;        #Numero de pasos espaciales
a0=8;         #Ancho ventana
h=2*a0/N;       #Paso espacial
ms=N;        #Numero de frecuencias de Fourier

#Se definen las frecuencias de Fourier

w=zeros(ms);
w=2*pi*collect((-ms/2):1:((ms/2)-1))./(2*a0);
w=fftshift(w);


#Definicion del pulso de entrada y todos los vectores a usar a lo largo de la propagación

x=range(-8,stop=7.68,length=N);
y=x';
pulso(x,y)=(2^0.25)*exp(-(x.^2+2*y.^2)/(2*2))/sqrt(pi*2);
f0=pulso.(x,y);

f=zeros(N,N).+0im;
desvx=zeros(Nt);
desvy=zeros(Nt);
densidad=zeros(N,N,Nt);
global f0; global f; global desvx; global desvy; 
