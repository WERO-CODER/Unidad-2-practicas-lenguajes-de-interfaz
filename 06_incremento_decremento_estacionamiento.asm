; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Decremento e incremento: control de ocupación de un estacionamiento
; Descripción: Simula entradas y salidas de vehículos, manteniendo la ocupación entre cero y diez espacios.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    menu BYTE 0Dh,0Ah,"1. Registrar entrada",0Dh,0Ah,"2. Registrar salida",0Dh,0Ah,"0. Terminar",0Dh,0Ah,"Selecciona una opcion: ",0
    ocupacionMsg BYTE "Vehiculos estacionados: ",0
    llenoMsg BYTE "Estacionamiento lleno.",0
    vacioMsg BYTE "No hay vehiculos para retirar.",0
    salidaMsg BYTE "Control finalizado.",0
    ocupacion DWORD 0
    capacidad DWORD 10

.code
main PROC
menuLoop:
    mov edx, OFFSET menu
    call WriteString
    call ReadInt

    cmp eax, 0
    je terminar
    cmp eax, 1
    je entrada
    cmp eax, 2
    je salida
    jmp mostrar

entrada:
    mov eax, ocupacion
    cmp eax, capacidad
    jae estacionamientoLleno
    inc ocupacion
    jmp mostrar

salida:
    cmp ocupacion, 0
    je estacionamientoVacio
    dec ocupacion
    jmp mostrar

estacionamientoLleno:
    mov edx, OFFSET llenoMsg
    call WriteString
    call Crlf
    jmp mostrar

estacionamientoVacio:
    mov edx, OFFSET vacioMsg
    call WriteString
    call Crlf

mostrar:
    mov edx, OFFSET ocupacionMsg
    call WriteString
    mov eax, ocupacion
    call WriteDec
    call Crlf
    jmp menuLoop

terminar:
    mov edx, OFFSET salidaMsg
    call WriteString
    call Crlf
    exit
main ENDP
END main
