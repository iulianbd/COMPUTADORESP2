#################################################################
## Asignatura: Estructura de Computadores.
## Grado II. 2º curso.
## Fichero: Desensamblar.asm
## Descripción: 
## Fichero de apoyo: Práctica: 3. Ejercicio 1
#################################################################



.text 
#instr 00000000000000000010010000010111
#00000000000000000010 01000 0010111
#              2        s0    auipc
auipc s0, 2
#s0 apunta a la direccion de a 0X2000

#instr 00000000000001000000010000010011
addi s0, s0, 0
#int a = 0
#instr 00000000100001000010010010000011
lw s1 8(s0)
#s1 = 0000ceba

#instr 00000000100001001001100100010011
slli s2, s1, 8
#s2 = 00ceba00
#instr 00000000110001000010100110000011
lw s3, 12(s0)

#instr 00000001001110010110101000110011
or s4, s2, s3

#instr 00000000010100000000101010010011
addi s5, zero, 5

#instr 00000001010110011010101100110011
slt s6, s3, s5

#instr 00000000000010110000011001100011
beq s6, zero, target1

#instr 00000001010001000010001000100011
sw s4, 4(s0)

#instr 00000000100000000000000001101111
jal zero, target2

#instr 00000001010001000010000000100011
target1: sw s4, 0(s0)

#instr 00000000000000000000000001101111
target2: jal zero, target2
	
.data  
a: 0x0
b: 0x0
c: 0x0000ceba
d: 0x00000005


