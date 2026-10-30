; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Ciclos numéricos
; Descripción: Utiliza un ciclo para mostrar una secuencia de números del 1 al 10.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    msg BYTE "Numeros del 1 al 10:",0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    call Crlf

    mov ecx, 10
    mov eax, 1
ciclo:
    call WriteDec
    call Crlf
    inc eax
    loop ciclo

    exit
main ENDP
END main
