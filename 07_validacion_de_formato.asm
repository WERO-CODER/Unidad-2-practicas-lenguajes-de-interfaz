; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Validación de formato
; Descripción: Verifica que la entrada contenga exactamente cinco caracteres numéricos.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa un codigo de exactamente 5 digitos: ",0
    valido BYTE "Formato correcto.",0
    invalido BYTE "Formato incorrecto. Deben ser 5 digitos del 0 al 9.",0
    buffer BYTE 32 DUP(0)
    longitud DWORD ?

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer - 1
    call ReadString
    mov longitud, eax

    cmp eax, 5
    jne formatoIncorrecto

    mov esi, OFFSET buffer
    mov ecx, 5

validarCaracter:
    mov al, [esi]
    cmp al, '0'
    jb formatoIncorrecto
    cmp al, '9'
    ja formatoIncorrecto
    inc esi
    loop validarCaracter

    mov edx, OFFSET valido
    call WriteString
    call Crlf
    jmp fin

formatoIncorrecto:
    mov edx, OFFSET invalido
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main
