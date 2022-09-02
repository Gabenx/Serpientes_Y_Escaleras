function turnos = decidirTurnos()

%{
Se simula el lanzamiento de un dado por cada jugador, si hay un empate
todos vuelven a tirar
%}
while(true)
   ply1 = round(rand()*5+1); 
   ply2 = round(rand()*5+1); 
   ply3 = round(rand()*5+1); 
   ply4 = round(rand()*5+1); 
   Jugadores = [ply1, ply2, ply3, ply4];
       if(length(unique(Jugadores)) == 4)
           break
       end
end


Turnos = zeros(1,4);
i = 1;
JugadoresTemp = Jugadores;
    %Se deciden los turnos según el valor maximo obtenido
    while(max(JugadoresTemp) ~= 0)
        cont = 0;
            while(true)
                cont = cont+1;               
                temp = JugadoresTemp(cont);
                    if(temp == max(JugadoresTemp))
                        %Si este jugador tiene el valor maximo le asignamos
                        %el turno correspondiente según i                           
                        Turnos(i) = cont;
                        JugadoresTemp(cont) = 0;
                        i = i+1;
                        break;
                    end
            end
    end
    turnos = Turnos;
end