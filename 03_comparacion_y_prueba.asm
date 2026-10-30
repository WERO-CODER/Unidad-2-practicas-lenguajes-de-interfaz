; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Comparación y prueba
; Descripción: Compara dos valores numéricos y utiliza TEST para comprobar bits de una máscara.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Ingresa el primer numero: ",0
    prompt2 BYTE "Ingresa el segundo numero: ",0
    mayorMsg BYTE "El primer numero es mayor.",0
    menorMsg BYTE "El segundo numero es mayor.",0
    igualMsg BYTE "Los numeros son iguales.",0
    testMsg BYTE "La prueba AND detecto el bit 0 activado.",0
    noTestMsg BYTE "La prueba AND no detecto el bit 0 activado.",0

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
    jg primeroMayor
    jl segundoMayor
    mov edx, OFFSET igualMsg
    call WriteString
    call Crlf
    jmp probarBits

primeroMayor:
    mov edx, OFFSET mayorMsg
    call WriteString
    call Crlf
    jmp probarBits

segundoMayor:
    mov edx, OFFSET menorMsg
    call WriteString
    call Crlf

probarBits:
    mov eax, ebx
    test eax, 1
    jz bitApagado
    mov edx, OFFSET testMsg
    call WriteString
    call Crlf
    jmp fin

bitApagado:
    mov edx, OFFSET noTestMsg
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main
