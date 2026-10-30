; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: PUSH y POP
; Descripción: Guarda tres valores en la pila y los recupera con POP, mostrando el orden LIFO.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    titulo BYTE "Valores recuperados de la pila (orden LIFO):",0

.code
main PROC
    mov eax, 10
    push eax
    mov eax, 20
    push eax
    mov eax, 30
    push eax

    mov edx, OFFSET titulo
    call WriteString
    call Crlf

    pop eax
    call WriteDec
    call Crlf

    pop eax
    call WriteDec
    call Crlf

    pop eax
    call WriteDec
    call Crlf

    exit
main ENDP
END main
