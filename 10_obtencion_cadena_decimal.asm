; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Obtención de una cadena decimal
; Descripción: Convierte un entero capturado a su representación decimal en caracteres y la despliega.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa un numero entero: ",0
    resultado BYTE "Representacion decimal: ",0
    buffer BYTE 16 DUP(0)
    negativo BYTE 0
    valor DWORD ?

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov valor, eax

    mov esi, OFFSET buffer
    mov eax, valor
    cmp eax, 0
    jge convertir
    mov negativo, 1
    neg eax

convertir:
    mov ebx, 10
    xor ecx, ecx

    cmp eax, 0
    jne dividir
    mov BYTE PTR [esi], '0'
    inc esi
    jmp agregarSigno

dividir:
    xor edx, edx
    div ebx
    add dl, '0'
    push edx
    inc ecx
    test eax, eax
    jnz dividir

guardarDigitos:
    pop edx
    mov [esi], dl
    inc esi
    loop guardarDigitos

agregarSigno:
    ; Coloca el terminador al final de los digitos generados.
    mov BYTE PTR [esi], 0
    cmp negativo, 0
    je terminarCadena

    ; Para numeros negativos, recorre los digitos una posicion a la derecha.
    mov edi, esi
moverDigitos:
    cmp esi, OFFSET buffer
    je ponerMenos
    dec esi
    mov al, [esi]
    mov [esi+1], al
    jmp moverDigitos

ponerMenos:
    mov BYTE PTR [esi], '-'
    mov BYTE PTR [edi+1], 0

terminarCadena:
    mov edx, OFFSET resultado
    call WriteString
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP
END main
