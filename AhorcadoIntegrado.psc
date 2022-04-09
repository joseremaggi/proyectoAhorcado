Algoritmo Ahorcado
	Definir opcion como entero;
	Definir salir como Logico;
	Definir palabraOculta como caracter;
	salir <- Falso;
	
	
	Mientras salir <> Verdadero Hacer
		Escribir "Ingrese una opcion";
		Escribir "1 para Jugar solo";
		Escribir "2 para jugar de a dos";
		Escribir "3 para ver Ayuda";
		Escribir "4 para salir";
		Leer opcion;
		Segun opcion Hacer
				
			1: palabraOculta<-listarPalabras();
				jugarAhorcado(palabraOculta,longitud(palabraOculta));
			2: jugarAhorcadoDosJugadores();
			3: Escribir "Mostrar ayuda de como jugar";
			4: 
				Escribir "Hasta la proxima";
				salir <- Verdadero;
			De Otro Modo:
				Escribir "Opcion incorecta";
		FinSegun
	FinMientras

FinAlgoritmo

Subproceso jugarAhorcadoDosJugadores()
	
	Definir palabraOculta como caracter;
	Definir tamanio como entero;
	Escribir "Jugador 1 elija una palabra";
	palabraOculta <- elegirPalabra();
	tamanio <- Longitud(palabraOculta);
	escribir "tamanio",tamanio;
	jugarAhorcado(palabraOculta,tamanio);
	Escribir palabraOculta;
FinSubproceso

Subproceso palabraOculta <- elegirPalabra()
	definir i como entero;
	definir valida como logico;
	definir palabraOculta como Caracter;
	valida<- Falso;
	
	Mientras valida == Falso hacer
	Leer palabraOculta;
	valida <- Verdadero;
	Para i<- 0 hasta longitud(palabraOculta)-1 Hacer
		Si (Subcadena(palabraOculta,i,i) < 'A' o Subcadena(palabraOculta,i,i) > 'z') Entonces
			Escribir "La palabra ingresada no es valida";
			i<- Longitud(palabraOculta);
			valida <- Falso;
		FinSi
	FinPara
	FinMientras
FinSubproceso
	Subproceso jugarAhorcado(palabraOculta,tamanio)
		Definir letra Como Caracter;
		Definir arregloPalabraOculta como Caracter;
		Definir arregloPalabraOcultaParcial como Caracter;
		Definir letrasYaElegidas como Caracter;
		Definir acerto como Logico;
		Definir juegoTerminado como Logico;
		Definir error como Entero;
		
		Dimension arregloPalabraOculta[15];
		Dimension arregloPalabraOcultaParcial[15];
		Dimension letrasYaElegidas[28];
		acerto <- Falso;
		juegoTerminado <- Falso;
		error<- 0;
		

	Escribir "Bienvenido al Ahorcado. Se seleccionara una palabra al azar para adivinar. Si te equivocas de letra 6 veces perdes";
	

	inicializarPalabraAdivinar(palabraOculta,arregloPalabraOculta,arregloPalabraOcultaParcial,tamanio);
	inicializarLetrasYaElegidas(letrasYaElegidas);
	Mientras (acerto == Falso Y juegoTerminado == Falso) Hacer
		limpiar pantalla;
		Escribir "";
		letra <- elegirUnaLetra(letrasYaElegidas);
		Si verificarAcierto(letra,arregloPalabraOculta,arregloPalabraOcultaParcial,tamanio)== Verdadero Entonces
			Si ganoJugador(palabraOculta,arregloPalabraOculta,arregloPalabraOcultaParcial,tamanio) == Verdadero Entonces
				escribir "gano";
				acerto <- Verdadero;
			SiNo
				mostrarPalabraOcultaParcial(arregloPalabraOcultaParcial,tamanio);
				
			FinSi
		SiNo
			error <- error + 1;
			mostrarError(error, palabraOculta);
			Si error==6 Entonces
				juegoTerminado <- Verdadero;
			SiNo
				Escribir "-------------------------------------------------------";
				mostrarPalabraOcultaParcial(arregloPalabraOcultaParcial,tamanio);
			FinSi
		FinSi
		
	FinMientras
    FinSubproceso



Subproceso acierto <- verificarAcierto(letra,arregloPalabraOculta,arregloPalabraOcultaParcial,tamanio)
	Definir i como Entero;
	Definir acierto como Logico;
	acierto<- Falso;
	Para i<- 0 hasta tamanio con paso 1 Hacer
		Si letra == arregloPalabraOculta[i] Entonces
			arregloPalabraOcultaParcial[i] <- letra;
			acierto <- Verdadero;
		FinSi
	FinPara
	
FinSubProceso


SubProceso  mostrarPalabraOcultaParcial(arregloPalabraOcultaParcial, tamanio)
	Definir i como Entero;
	Escribir "Esto es lo que has adivinado de la Palabra oculta";
	Para i<- 0 hasta tamanio con paso 1 Hacer
		Escribir sin saltar arregloPalabraOcultaParcial[i];
	FinPara
	Escribir "";
	
FinSubProceso
Subproceso gano <- ganoJugador(palabraOculta,arregloPalabraOculta,arregloPalabraOcultaParcial,tamanio)
	Definir gano como Logico;
	Definir i como entero;
	gano <- Verdadero;
	Para i<- 0 hasta tamanio-1 con paso 1 Hacer
			Si arregloPalabraOculta[i] <> arregloPalabraOcultaParcial[i]   Entonces
			gano <- Falso;
			FinSi
		
	FinPara
	
FinSubProceso


SubProceso palabra<-listarPalabras()
	Definir palabra Como Caracter;
	Definir nroAzar Como Entero;
	
	nroAzar<-azar(5);
	
	Segun nroAzar Hacer
		1: palabra<-"iguana";
		2: palabra<-"azteca";
		3: palabra<-"sastre";
		4: palabra<-"infima";
		5: palabra<-"pincel";
	FinSegun
FinSubProceso

//Este subproceso recibe el arreglo de letras ya elegidas para inicializarlo con valores - en todas sus posiciones
Subproceso inicializarLetrasYaElegidas(letrasYaElegidas por referencia)
	Definir i Como Entero;
	Para i<- 0 hasta 27 con paso 1 Hacer
		letrasYaElegidas[i] <- "-";
	FinPara
FinSubProceso

// este subproceso recibe el arreglo de letras ya elegidas y devuelve una letra. Valida que el caracter recibido sea una letra
Subproceso letra <- elegirUnaLetra(letrasYaElegidas Por Referencia)
	Definir letra Como Caracter;
	Definir i como entero;
	definir caracterValido Como Logico;
	caracterValido <-falso;
	
	Mientras caracterValido <> Verdadero Hacer
		Escribir "";
		Escribir "Letras que ya elegiste ";
		Escribir "";
		Para i<- 0 hasta 27 con paso 1 Hacer
			Si letrasYaElegidas[i] <> "-" Entonces
				Escribir sin saltar letrasYaElegidas[i];
			FinSi
		FinPara
		Escribir "";
		Escribir "Ingrese una letra";
		Leer letra;
		Si (letra < 'A' o letra > 'z') entonces
			Escribir "Ingrese un caracter valido:";
		SiNo
			letra <- Minusculas(letra);
			Para i <- 0 Hasta 27 Con Paso 1 Hacer
				Si letra == letrasYaElegidas[i] Entonces
					Escribir "Ya eligio esa letra. Elija otra";
					i<-27;
				Sino 
					Si letrasYaElegidas[i] == "-" Entonces
					letrasYaElegidas[i] <- letra;
					caracterValido <- Verdadero;
					i<-27;
				FinSi
				Finsi
				
			FinPara
			Escribir "";
		FinSi
		ordenarLetrasYaElegidas(letrasYaElegidas);
	FinMientras
	
FinSubproceso

Subproceso ordenarLetrasYaElegidas(letrasYaElegidas por referencia)
	Definir i Como Entero;
	Definir auxiliar Como Caracter;
	Para i<- 1 hasta 27 Hacer
		Si letrasYaElegidas[i-1] > letrasYaElegidas[i] Entonces
			auxiliar <-letrasYaElegidas[i-1];
			letrasYaElegidas[i-1] <- letrasYaElegidas[i];
			letrasYaElegidas[i]<- auxiliar;
		FinSi
	FinPara
	
FinSubProceso
//este subproceso dibuja el monigote de acuerdo a la cantidad de errores que haya tenido el usuario. Recibe error y palabra oculta. error lo recibe para determinar
//que va a dibujar del monigote. Palabra oculta para mostrarla si el jugador perdio por cometer la cantidad maxima de errores.
Subproceso mostrarError(error, palabraOculta)

Segun error Hacer

	1:
		Escribir "***********";
		Escribir "*";
		Escribir "*";
		Escribir "*";
		Escribir "TE QUEDAN 5 INTENTOS";
	
	2:
		Escribir "***********";
		Escribir "*       0";
		Escribir "*";
		Escribir "*";
		Escribir "TE QUEDAN 4 INTENTOS";
	3:
		Escribir "***********";
		Escribir "*       0";
		Escribir "*       |";
		Escribir "*";
		Escribir "TE QUEDAN 3 INTENTOS";
	4:
		Escribir "**********";
		Escribir "*       0";
		Escribir "*      -|";
		Escribir "*";
		Escribir "TE QUEDAN 2 INTENTOS";
	5:
		Escribir "**********";
		Escribir "*        0";
		Escribir "*       -|-";
		Escribir "*";
		Escribir "TE QUEDAN 1 INTENTOS";
	6:
		Escribir "**********";
		Escribir "*        0";
		Escribir "*       -|-";
		Escribir "*        ^";
		Escribir "ESTAS AHORCADO.....!!!!!!!";
		Escribir " EL JUEGO HA FINALIZADO.!!";
		Escribir "LA PALABRA ERA: ",palabraOculta;
	FinSegun
FinSubProceso

//este subproceso inicializa los arreglos de la palabra oculta y la palabra oculta acertada parcialmente.Recibe una cadena palabraOculta y dos arreglos.
//El primer arreglo al finalizaar estre subproceso queda con la palabra oculta letra por letra en cada posicion. Arreglo palabra oculta parcial se inicializa con _
Subproceso inicializarPalabraAdivinar(palabraOculta, arregloPalabraOculta Por Referencia, arregloPalabraOcultaParcial por Referencia,tamanio)
	Definir i como Entero;
	i<- 0;
	Para  i<- 0 Hasta tamanio Con Paso 1 Hacer
		arregloPalabraOculta[i]<-Subcadena(palabraOculta,i,i);//AQUI VAMOS A SACAR UN CARACTER DE LA PALABRA 
		//secreta  en la posicion x.x. Es decir estoy 
		//tomando el primer caracter de la palabra secreta y 
		//lo estoy almacenando en el vector1 en la posicion 1 	
		arregloPalabraOcultaParcial[i] <-"_"; // aqui tambien vamos a llenar el vector2 lo llenamos
		//con raFinSubProceso
	FinPara
	Para i<- tamanio+1 hasta 14 hacer
		arregloPalabraOculta[i]<- "_";
		arregloPalabraOcultaParcial[i] <-"_";
	FinPara
FinSubProceso
