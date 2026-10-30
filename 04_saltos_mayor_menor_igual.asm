; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Saltos: mayor, menor o igual con entrada del usuario
; Descripción: Lee dos números y utiliza saltos condicionales para determinar su relación.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Ingresa el primer numero: ",0
    prompt2 BYTE "Ingresa el segundo numero: ",0
    msgMayor BYTE "El primer numero es MAYOR.",0
    msgMenor BYTE "El primer numero es MENOR.",0
    msgIgual BYTE "Ambos numeros son IGUALES.",0

.code
main PROC
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov ebx, eax

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt

    cmp ebx, eax
    jg esMayor
    jl esMenor

    mov edx, OFFSET msgIgual
    call WriteString
    call Crlf
    jmp terminar

esMayor:
    mov edx, OFFSET msgMayor
    call WriteString
    call Crlf
    jmp terminar

esMenor:
    mov edx, OFFSET msgMenor
    call WriteString
    call Crlf

terminar:
    exit
main ENDP
END main
