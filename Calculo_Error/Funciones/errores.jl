# Script para calcular el error del método RK4IP a través del cambio en la norma

sum1=sum(sum(abs2.(densidad[:,:,1]),dims=1));
sum2=sum(sum(abs2.(densidad[:,:,2],),dims=1));
E1=abs((sum2-sum1)./(Nt.*sum1));

open("Output/Errores.txt","a") do io
	println(io,Nt,"\t",E1,"\t",tiempo);
end

