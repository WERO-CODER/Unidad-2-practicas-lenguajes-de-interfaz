; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Operaciones aritméticas
; Descripción: Solicita dos enteros y muestra suma, resta, multiplicación y división entera.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Ingresa el primer entero: ",0
    prompt2 BYTE "Ingresa el segundo entero: ",0
    sumaMsg BYTE "Suma: ",0
    restaMsg BYTE "Resta: ",0
    multiMsg BYTE "Multiplicacion: ",0
    divisionMsg BYTE "Division entera: ",0
    errorMsg BYTE "No se puede dividir entre cero.",0
    num1 SDWORD ?
    num2 SDWORD ?

.code
main PROC
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov num1, eax

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov num2, eax

    mov edx, OFFSET sumaMsg
    call WriteString
    mov eax, num1
    add eax, num2
    call WriteInt
    call Crlf

    mov edx, OFFSET restaMsg
    call WriteString
    mov eax, num1
    sub eax, num2
    call WriteInt
    call Crlf

    mov edx, OFFSET multiMsg
    call WriteString
    mov eax, num1
    imul eax, num2
    call WriteInt
    call Crlf

    cmp num2, 0
    je divisionCero
    mov edx, OFFSET divisionMsg
    call WriteString
    mov eax, num1
    cdq
    idiv num2
    call WriteInt
    call Crlf
    jmp fin

divisionCero:
    mov edx, OFFSET errorMsg
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main
