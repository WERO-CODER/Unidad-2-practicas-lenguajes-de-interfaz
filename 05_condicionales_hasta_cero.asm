; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Condicionales: repetir hasta que el usuario ingrese cero
; Descripción: Solicita números repetidamente y termina cuando el usuario introduce cero.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa un numero (0 para terminar): ",0
    aviso BYTE "Capturaste: ",0
    finMsg BYTE "Se ingreso cero. Programa terminado.",0

.code
main PROC
leerNumero:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt

    cmp eax, 0
    je terminar

    mov ebx, eax
    mov edx, OFFSET aviso
    call WriteString
    mov eax, ebx
    call WriteInt
    call Crlf
    jmp leerNumero

terminar:
    mov edx, OFFSET finMsg
    call WriteString
    call Crlf
    exit
main ENDP
END main
