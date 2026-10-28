#################################################################
## Asignatura: Estructura de Computadores.
## Grado II. 2� curso.
## Fichero: calculaSumaMult.asm
## Descripci�n: Programa que calcula la suma de dos operandos y posteriormente multiplica por 2, todo a trav�s de una funci�n
## Fichero de apoyo: Pr�ctica: 3. Ejercicio: 2
#################################################################

.text

main:		
	#Se guarda en s0 la direcci�n del s�mbolo A. A partir de ah� tambi�n se puede acceder f�cilmente a Y y R
	la s0, A
	#Lectura de A y guardado en un registro... utilice uno de los registros espec�ficos
	lw a0, 0(s0)
	#Lectura de B y guardado en un registro... utilice uno de los registros espec�ficos
	lw a1, 4(s0)
	#Llamada a funci�n
	jal funcion1
	#Guardado del retorno en la variable R de memoria
	sw a1, 8(s0)
	#Bucle infinito
target: jal zero, target

funcion1:
	addi sp, sp, -4
	sw ra, 0(sp)
	
	slli a0, a0, 2
	slli a1, a1, 1
	sub a0, a0, a1
	
	jal compl_a_2
	#Retorno a main
	slli a1, a1, 1
	lw ra, 0(sp)
	addi sp, sp, 4
	
	jr ra

compl_a_2:
	sub a1, zero, a0
	jr ra
	

.data
A: 10
B: 6
R: