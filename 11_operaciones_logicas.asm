; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Operaciones lógicas
; Descripción: Aplica AND, OR, XOR y NOT a dos valores ingresados por el usuario.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Ingresa el primer valor entero: ",0
    prompt2 BYTE "Ingresa el segundo valor entero: ",0
    andMsg BYTE "AND: ",0
    orMsg BYTE "OR: ",0
    xorMsg BYTE "XOR: ",0
    notMsg BYTE "NOT del primer valor: ",0
    valor1 DWORD ?
    valor2 DWORD ?

.code
main PROC
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov valor1, eax

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov valor2, eax

    mov edx, OFFSET andMsg
    call WriteString
    mov eax, valor1
    and eax, valor2
    call WriteHex
    call Crlf

    mov edx, OFFSET orMsg
    call WriteString
    mov eax, valor1
    or eax, valor2
    call WriteHex
    call Crlf

    mov edx, OFFSET xorMsg
    call WriteString
    mov eax, valor1
    xor eax, valor2
    call WriteHex
    call Crlf

    mov edx, OFFSET notMsg
    call WriteString
    mov eax, valor1
    not eax
    call WriteHex
    call Crlf

    exit
main ENDP
END main
