# proyectoAhorcado
Juego para 1 o dos jugadores.
El juego consiste en intentar adivinar una palabra. En el modo para un jugador la palabra se determina sacando un numero al azar y buscando la palabra que esta en un arreglo en esa posicion. Cuando se juega de a dos uno de los jugadores elije la palabra y el otro intenta adivinarla.
Se consta de 6 intentos para adivinar la palabra. Al fallar 6 veces el juego termina.
La cantidad de errores se muestra dibujando un muñeco al que se le van representando mas partes del cuerpo mientras mas errores comete el jugador.

El juego muestra un menu en el cual el jugador ingresa una opcion. Si ingresa 1 jugara solo, si ingresa dos jugara contra otro jugador, si ingresa 3 vera la ayuda, si ingresa 4 sale. En cualquier otro caso muestra un error y pide ingresar un valor valido.

Modo para dos jugadores:
Se solicita ingresar una palabra al jugador 1. Se verifica que sea una palabra valida, o sea que solo contenga letras minusuclas o mayusculas, no otro tipo de caracteres ni numeros. Luego se determina el tamaño de la palabra y se le pasan estos datos al subproceso jugarAhorcado, el cual es el mismo que se usa jugando solo.

Modo para un jugador:
Se selecciona una palabra al azar usando el subproceso listarParalabras. Luego se invoca el subproceso jugarAhorcado

El jeugo consiste en solocitar al jugador que ingrese una letra, la cual se verifica que sea una letra y no un caracter o numero. Luego se compara la letra ingresada con la palabra a adivinar. Para hacer esto inicializamos un arreglo con la palabra a adivinar, un caracter en cada posicion. Si la letra se encuentra en la palabra se agrega en un arreglo palabraParcialmenteAdivinada, si no esta en la palabra se cuenta un erro y se dibuja el muñeco. En cualquier caso cada vez que el usuario selecciona una letra se muestra la palabra parcialmente adivinada y las letras ya seleccionadas. Si el jugador elije una letra que ya elijio anteriormente se le solicita ingresasr otra, no cuenta como un error.
Si al cabo de 6 intento no adivino la palabra, el juego termina. Si logra adivinar la palabra completa s ele muestra un mensaje de que gano
