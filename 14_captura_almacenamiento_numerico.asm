; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Captura y almacenamiento de datos numéricos
; Descripción: Captura cinco números, los almacena en un arreglo y calcula su suma y promedio.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa un numero: ",0
    listaMsg BYTE "Numeros almacenados:",0
    sumaMsg BYTE "Suma: ",0
    promedioMsg BYTE "Promedio entero: ",0
    numeros SDWORD 5 DUP(?)
    suma SDWORD 0

.code
main PROC
    mov esi, OFFSET numeros
    mov ecx, LENGTHOF numeros

capturar:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [esi], eax
    add suma, eax
    add esi, TYPE numeros
    loop capturar

    call Crlf
    mov edx, OFFSET listaMsg
    call WriteString
    call Crlf

    mov esi, OFFSET numeros
    mov ecx, LENGTHOF numeros

mostrar:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, TYPE numeros
    loop mostrar

    mov edx, OFFSET sumaMsg
    call WriteString
    mov eax, suma
    call WriteInt
    call Crlf

    mov edx, OFFSET promedioMsg
    call WriteString
    mov eax, suma
    cdq
    mov ebx, LENGTHOF numeros
    idiv ebx
    call WriteInt
    call Crlf

    exit
main ENDP
END main
