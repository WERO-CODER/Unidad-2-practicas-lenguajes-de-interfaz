; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Captura y desplegado de mensajes
; Descripción: Solicita un mensaje al usuario y después lo muestra en pantalla.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt BYTE "Escribe un mensaje: ",0
    result BYTE "El mensaje capturado fue: ",0
    buffer BYTE 200 DUP(0)

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString

    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer - 1
    call ReadString

    call Crlf
    mov edx, OFFSET result
    call WriteString
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP
END main
