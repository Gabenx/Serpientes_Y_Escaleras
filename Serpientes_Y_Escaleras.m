
clear all

%Vectores en los que se almacenarán las escaleras y serpientes
n = 5; %Cantidad de escaleras 
%Generación de las posiciones de las escaleras 

%[EscalerasI, EscalerasF] = generarEscaleras(n);
%[SerpientesI, SerpientesF] = generarSerpientes(n,EscalerasI,EscalerasF);

%Valores rta1 EF[66,94,67,79,95] EI[40,75,47,61,84]
% SF[8,48,24,11,7] SI[85,62,36,42,44]

EscalerasI = [40,75,47,61,84];
EscalerasF = [66,94,67,79,95];
SerpientesI = [85,62,36,42,44];
SerpientesF = [8,48,24,11,7];

%Preguntas a responder 
%1. Cual es la probabilidad de que el ganador solo utilice una escalera?
%2. Cual es la probabilidad de que el ganador caiga exactamente en 100?
%3. Cual es la probabilidad de que el ganador caiga en 4 serpientes? 
%4. Cual es la cantidad de turnos promedio para ganar? 
%5. Cual es la probabilidad de que el ganador no haya usado ninguna
%serpiente ni ninguna escalera?

cantJuegos = 100000;
rta1 = 0;
rta2 = 0;
rta3 = 0;
rta4 = zeros(1,cantJuegos);
rta5 = 0;

for j=1:cantJuegos
    
    %Comenzar el juego
    
    enjuego = true;
    
    %Vector para almacenar posiciones de la ficha de cada jugador (hasta 4)
    %cada indice corresponde al jugador, es decir i=1 es el jugador 1, i=2 es
    %el jugador 2 y así sucesivamente.
    posiciones = zeros(1,4);
    
    %Decidir el turno de los jugadores 
    turnos = decidirTurnos;
    
    %Declaramos vectores para contar la cantidad de veces que un jugador cae en
    %una escalera o una serpiente, cada indice corresponde al jugador, es decir
    %i=1 es el jugador 1, i=2 es el jugador 2 y así sucesivamente
    cantEscaleras = zeros(1,4);
    cantSerpientes = zeros(1,4);
    cantTurnos = zeros(1,4);
    
    while(enjuego)

        %Este for corresponde a una ronda de 4 turnos
        for i = 1:length(turnos)
            %Se tira el dado
            mov = round(rand()*5+1); 
            %Según el jugador que lo tiró se mueve la ficha
            posiciones(turnos(i)) = posiciones(turnos(i)) + mov;
            %Se verifica si cayó en una escalera
            if(ismember(posiciones(turnos(i)),EscalerasI))
                indexT = find(EscalerasI==posiciones(turnos(i)));
                %Se pasa al final de la escalera
                posiciones(turnos(i)) = EscalerasF(indexT);
                %Se añade uno a la cantidad de veces que este jugador ha caido
                %en una escalera
                cantEscaleras(turnos(i)) = cantEscaleras(turnos(i))+1;
            elseif(ismember(posiciones(turnos(i)),SerpientesI))
                %Se verifica si cayó en una serpiente
                indexT = find(SerpientesI==posiciones(turnos(i)));
                %Se pasa al final de la serpiente
                posiciones(turnos(i)) =	SerpientesF(indexT);
                %Se añade uno a la cantidad de veces que este jugador ha caido
                %en una serpiente
                cantSerpientes(turnos(i)) = cantSerpientes(turnos(i))+1;
            end
            %Si un jugador se encuentra en la posición 100 o más quiere decir
            %que ganó
            cantTurnos(turnos(i)) = cantTurnos(turnos(i))+1;

            if(posiciones(turnos(i)) >= 100)
                enjuego = false;
                ganador = turnos(i);
                
                %Variable Montecarlo primera pregunta
                if(cantEscaleras(ganador) == 1)
                    rta1 = rta1+1;
                end
                
                %Variable Montecarlo segunda pregunta
                if(posiciones(turnos(i)) == 100)
                    rta2 = rta2+1;
                end
                
                %Variable Montecarlo tercera pregunta
                if(cantSerpientes(ganador) == 4)
                    rta3 = rta3+1;
                end
                
                %Variable Montecarlo cuarta pregunta
                rta4(j) = cantTurnos(turnos(i));
                   
                %Variable Montecarlo quinta pregunta
                if(cantEscaleras(ganador) == 0 && cantSerpientes(ganador) == 0)
                    rta5 = rta5+1;
                end
                
                break
            end
                               
        end
        
    end

end

%Respuesta pregunta 1 
Rta1 = rta1/cantJuegos;

%Respuesta pregunta 2 
Rta2 = rta2/cantJuegos;

%Respuesta pregunta 3 
Rta3 = rta3/cantJuegos;

%Respuesta pregunta 4 
Rta4 = mean(rta4);

%Respuesta pregunta 5 
Rta5 = rta5/cantJuegos;

Respuestas = [Rta1,Rta2,Rta3,Rta4,Rta5];