
function [SerpientesIR, SerpientesFR] = generarSerpientes(n,escI,escF)

SerpientesI = zeros(1,n);
SerpientesF = zeros(1,n);
EscalerasI = escI;
EscalerasF = escF;

for i=1:n 
    if(i==1)
    SerpientesF(1) = inf; %Nos aseguramos de que el while se ejecute
    num = ceil(rand()*88+11);
    
    %Condiciones para que la posición no coincida con una escalera
    cond1 = ismember(num,EscalerasI);
    cond2 = ismember(num,EscalerasF);
    while(cond1 || cond2)
        num = ceil(rand()*88+11);
        cond1 = ismember(num,EscalerasI);
        cond2 = ismember(num,EscalerasF);
    end
    SerpientesI(1) = num;
        num = floor(rand()*84+1);
        cond3 = abs(SerpientesI(i) - num) < 10;
         while(SerpientesI(1)<num || cond3)   
             num = floor(rand()*84+1);
             cond3 = abs(SerpientesI(i) - num) < 10;
         end
    SerpientesF(1) = num;
    else
        
        num = ceil(rand()*88+11); %Generacion del número inicial
        
        %Declararemos las condiciones para verificar la correcta 
        %generación de las escaleras
        cond1 = ismember(num,EscalerasI);
        cond2 = ismember(num,EscalerasF);
        cond3 = ismember(num,SerpientesI);
        cond4 = ismember(num,SerpientesF);
        while(cond1 || cond2 || cond3 || cond4)   
        num = ceil(rand()*88+11);
        cond1 = ismember(num,EscalerasI);
        cond2 = ismember(num,EscalerasF);
        cond3 = ismember(num,SerpientesI);
        cond4 = ismember(num,SerpientesF);
        end
        SerpientesI(i) = num;
        
        num = floor(rand()*84+1); %Generacion del número final
        
        cond1 = ismember(num,EscalerasI);
        cond2 = ismember(num,EscalerasF);
        cond3 = abs(SerpientesI(i) - num) < 10;
        cond4 = num>SerpientesI(i);
        cond5 = ismember(num,SerpientesI);
        cond6 = ismember(num,SerpientesF);
        
        while(cond1 || cond2 || cond3 || cond4 || cond5 || cond6)
            num = floor(rand()*84+1);
            cond1 = ismember(num,EscalerasI);
            cond2 = ismember(num,EscalerasF);
            cond3 = abs(SerpientesI(i) - num) < 10;
            cond4 = num>SerpientesI(i);
            cond5 = ismember(num,SerpientesI);
            cond6 = ismember(num,SerpientesF);
        end
        
        SerpientesF(i) = num;
        
    end
    
end
SerpientesIR = SerpientesI;
SerpientesFR = SerpientesF;
end