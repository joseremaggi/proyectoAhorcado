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
			3: mostrarAyuda();
			4: 
				Escribir "Hasta la proxima";
				mostrarCreditos();
				salir <- Verdadero;
			De Otro Modo:
				Escribir "Opcion incorecta";
		FinSegun
	FinMientras

FinAlgoritmo


Subproceso mostrarAyuda()
	Escribir "Juego para 1 o dos jugadores";
	Escribir "El juego consiste en intentar adivinar una palabra. En el modo para un jugador la palabra se determina sacando un numero al azar y buscando la palabra que esta en un arreglo en esa posicion. Cuando se juega de a dos uno de los jugadores elije la palabra y el otro intenta adivinarla.";
	Escribir "Se consta de 6 intentos para adivinar la palabra. Al fallar 6 veces el juego termina.";
	Escribir "La cantidad de errores se muestra dibujando un muñeco al que se le van representando mas partes del cuerpo mientras mas errores comete el jugador.";
	Escribir "El juego muestra un menu en el cual el jugador ingresa una opcion. Si ingresa 1 jugara solo, si ingresa dos jugara contra otro jugador, si ingresa 3 vera la ayuda, si ingresa 4 sale. En cualquier otro caso muestra un error y pide ingresar un valor valido.";
	Escribir "Modo para dos jugadores:";
	Escribir "Se solicita ingresar una palabra al jugador 1. Se verifica que sea una palabra valida, o sea que solo contenga letras minusuclas o mayusculas, no otro tipo de caracteres ni numeros. Luego se determina el tamaño de la palabra y se le pasan estos datos al subproceso jugarAhorcado, el cual es el mismo que se usa jugando solo.";
	Escribir "Modo para un jugador:";
	Escribir "Se selecciona una palabra al azar usando el subproceso listarParalabras. Luego se invoca el subproceso jugarAhorcado";
	EScribir "El juego consiste en solocitar al jugador que ingrese una letra, la cual se verifica que sea una letra y no un caracter o numero. Luego se compara la letra ingresada con la palabra a adivinar. Para hacer esto inicializamos un arreglo con la palabra a adivinar, un caracter en cada posicion. Si la letra se encuentra en la palabra se agrega";
	Escribir "en un arreglo palabraParcialmenteAdivinada, si no esta en la palabra se cuenta un erro y se dibuja el muñeco. En cualquier caso cada vez que el usuario selecciona una letra se muestra la palabra parcialmente adivinada y las letras ya seleccionadas. Si el jugador elije una letra que ya elijio anteriormente se le solicita ingresasr otra, no cuenta como un error.";
	Escribir "Si al cabo de 6 intento no adivino la palabra, el juego termina. Si logra adivinar la palabra completa s ele muestra un mensaje de que gano";
FinSubProceso
//muestra el nombre de los integrantes del grupo
Subproceso mostrarCreditos()
	Escribir "Grupo Familia Ensamblada";
	Esperar 1 Segundos;
	Escribir "Integrantes: ";
	Esperar 1 Segundos;
	Escribir "Soraya Melanie Bazan";
	Esperar 1 Segundos;
	Escribir "Mercedes Victoria Zaccaro";
	Esperar 1 Segundos;
	Escribir "Duckwitz Gerardo FEderico";
	Esperar 1 Segundos;
	Escribir "Mofficone Franco David";
	Esperar 1 Segundos;
	Escribir "Anabel Gisella Alesci";
	Esperar 1 Segundos;
	Escribir "Jose Luis Remaggi";
	Esperar 1 Segundos;
	Escribir "Franco Viberti";
	Esperar 1 Segundos;
	Escribir "Jesus Mercado";
	Esperar 1 Segundos;
	Escribir "Yesica Beatriz Lopez";
	Esperar 1 Segundos;
	Escribir "Matias Villa";

FinSubProceso

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
	Limpiar Pantalla;
	Mientras (acerto == Falso Y juegoTerminado == Falso) Hacer
		limpiar pantalla;
		Escribir "";
		letra <- elegirUnaLetra(letrasYaElegidas,tamanio);
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

//se muestra el contenido de palabra oculta parcial, que es lo que lleva adivinado el jugador
SubProceso  mostrarPalabraOcultaParcial(arregloPalabraOcultaParcial, tamanio)
	Definir i como Entero;
	Escribir "Esto es lo que has adivinado de la Palabra oculta";
	Para i<- 0 hasta tamanio-1 con paso 1 Hacer
		Si (arregloPalabraOcultaParcial[i] <> "-") Entonces
			Escribir sin saltar arregloPalabraOcultaParcial[i];
			Escribir sin saltar" ";
		SiNo
			Escribir sin saltar "_";
			Escribir sin saltar " ";
		FinSi
		
	FinPara
	Escribir "";
	
FinSubProceso
//se compara palabraOculta con palabraOcultaParcial. Si coinciden es porque el jugador adivino.
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

//se saca un numero al azar y se elije una palabra de acuerdo a ese numero.
SubProceso palabra<-listarPalabras()
	Definir palabra Como Caracter;
	Definir nroAzar Como Entero;
	
	nroAzar<-azar(5)+1;
	
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
		letrasYaElegidas[i] <- "_";
	FinPara
FinSubProceso

// este subproceso recibe el arreglo de letras ya elegidas y devuelve una letra. Valida que el caracter recibido sea una letra
Subproceso letra <- elegirUnaLetra(letrasYaElegidas Por Referencia,tamanio)
	Definir letra Como Caracter;
	Definir i como entero;
	definir caracterValido,yaElegida Como Logico;
	caracterValido <-falso;
	
	Mientras caracterValido <> Verdadero Hacer
		Escribir "";
		Escribir "Letras que ya elegiste ";
		Escribir "";
		Para i<- 0 hasta 27 con paso 1 Hacer
			Si letrasYaElegidas[i] <> "_" Entonces
				Escribir sin saltar "|";
				Escribir sin saltar letrasYaElegidas[i];
				Escribir sin saltar "|";
				
			FinSi
		FinPara
		Escribir "";
		Escribir "Ingrese una letra";
		Leer letra;
		Si (letra < 'A' o letra > 'z' o longitud(letra)>1) entonces
			Escribir "Ingrese un caracter valido:";
		SiNo
			letra <- Minusculas(letra);
			i<- 0 ;
			Para i<- 0 hasta 27 Hacer
				Si letrasYaElegidas[i] = letra Entonces
					Escribir "Ya eligio esa letra";
					i<- 99;
				FinSi
			FinPara
			Si i<> 100 Entonces
				letrasYaElegidas[0] <- letra;
				caracterValido <- Verdadero;
			FinSi
			Escribir "";
		FinSi
		ordenarLetrasYaElegidas(letrasYaElegidas);
	FinMientras
	
FinSubproceso

//este subproceso ordena las letras ya elegidas para que sea mas facil para el usuario ver cuales ya eligio
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
