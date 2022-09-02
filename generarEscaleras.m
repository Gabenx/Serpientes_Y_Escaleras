function [EscalerasIR, EscalerasFR] = generarEscaleras(n)

EscalerasI = zeros(1,n);
EscalerasF = zeros(1,n);

for i=1:n
    %Verificamos la primera iteración
    if(i==1)
    EscalerasF(1) = 0; %Nos aseguramos de que el while se ejecute
        num = floor(rand()*84+1);
        EscalerasI(i) = num;
        num = ceil(rand()*88+11);
        cond3 = abs(EscalerasI(i) - num) < 10;
         while(num<EscalerasI(1) || cond3)
             num = ceil(rand()*88+11);
             cond3 = abs(EscalerasI(i) - num) < 10;
         end
         
      EscalerasF(i) = num;
    
    else
        
        num = floor(rand()*84+1); %Generacion del número inicial
        
        %Declararemos las condiciones para verificar la correcta 
        %generación de las escaleras
        cond1 = ismember(num,EscalerasI);
        cond2 = ismember(num,EscalerasF);
        
        while(cond1 || cond2)   
        num = floor(rand()*84+1);
        cond1 = ismember(num,EscalerasI);
        cond2 = ismember(num,EscalerasF);
        end
        EscalerasI(i) = num;
        num = ceil(rand()*88+11); %Generacion del número final
        
        cond1 = ismember(num,EscalerasI);
        cond2 = ismember(num,EscalerasF);
        cond3 = abs(EscalerasI(i) - num) < 10;
        cond4 = num<EscalerasI(i);
        
        while(cond1 || cond2 || cond3 || cond4)
            num = ceil(rand()*88+11);
            cond1 = ismember(num,EscalerasI);
            cond2 = ismember(num,EscalerasF);
            cond3 = abs(EscalerasI(i) - num) < 10;
            cond4 = num<EscalerasI(i);
        end
        
        EscalerasF(i) = num;
        
    end
    
end
EscalerasIR = EscalerasI;
EscalerasFR = EscalerasF;
end