; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Desplazamiento y rotación
; Descripción: Demuestra las instrucciones SHL, SHR, ROL y ROR sobre un valor capturado.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa un valor entero sin signo: ",0
    shlMsg BYTE "SHL 1: ",0
    shrMsg BYTE "SHR 1: ",0
    rolMsg BYTE "ROL 1: ",0
    rorMsg BYTE "ROR 1: ",0
    original DWORD ?

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadDec
    mov original, eax

    mov edx, OFFSET shlMsg
    call WriteString
    mov eax, original
    shl eax, 1
    call WriteHex
    call Crlf

    mov edx, OFFSET shrMsg
    call WriteString
    mov eax, original
    shr eax, 1
    call WriteHex
    call Crlf

    mov edx, OFFSET rolMsg
    call WriteString
    mov eax, original
    rol eax, 1
    call WriteHex
    call Crlf

    mov edx, OFFSET rorMsg
    call WriteString
    mov eax, original
    ror eax, 1
    call WriteHex
    call Crlf

    exit
main ENDP
END main
