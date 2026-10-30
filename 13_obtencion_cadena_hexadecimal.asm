; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Obtención de una cadena hexadecimal
; Descripción: Lee un número entero y muestra su representación hexadecimal de 32 bits.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa un numero entero sin signo: ",0
    resultado BYTE "Representacion hexadecimal (32 bits): ",0
    valor DWORD ?

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadDec
    mov valor, eax

    mov edx, OFFSET resultado
    call WriteString
    mov eax, valor
    call WriteHex
    call Crlf

    exit
main ENDP
END main
