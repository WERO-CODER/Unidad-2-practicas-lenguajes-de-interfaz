; Materia: Lenguajes de Interfaz
; Alumno: Carlos Alfonso Rivas Nuñez
; Horario: 08-09
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Manipulación de archivos
; Descripción: Crea un archivo de texto, escribe un mensaje, lo vuelve a abrir y lee su contenido.
;
; Ensamblador: MASM x86 de 32 bits
; Biblioteca: Irvine32

INCLUDE Irvine32.inc

.data
    nombreArchivo BYTE "practica15.txt",0
    mensaje BYTE "Archivo creado y escrito desde Assembly con Irvine32.",0
    mensajeLen DWORD ($ - mensaje)
    buffer BYTE 256 DUP(0)
    handle DWORD ?
    bytesLeidos DWORD ?
    crearMsg BYTE "Se creo el archivo y se escribio el contenido.",0
    leerMsg BYTE "Contenido leido del archivo:",0
    errorMsg BYTE "Ocurrio un error al trabajar con el archivo.",0

.code
main PROC
    ; Crear o reemplazar el archivo.
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile
    cmp eax, INVALID_HANDLE_VALUE
    je errorArchivo
    mov handle, eax

    ; Escribir el mensaje en el archivo.
    mov eax, handle
    mov edx, OFFSET mensaje
    mov ecx, mensajeLen
    call WriteToFile
    jc errorCerrar
    mov eax, handle
    call CloseFile

    mov edx, OFFSET crearMsg
    call WriteString
    call Crlf

    ; Abrir el archivo para lectura.
    mov edx, OFFSET nombreArchivo
    call OpenInputFile
    cmp eax, INVALID_HANDLE_VALUE
    je errorArchivo
    mov handle, eax

    ; Leer los bytes del archivo al buffer.
    mov eax, handle
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer - 1
    call ReadFromFile
    jc errorCerrar
    mov bytesLeidos, eax
    mov BYTE PTR buffer[eax], 0

    mov eax, handle
    call CloseFile

    mov edx, OFFSET leerMsg
    call WriteString
    call Crlf
    mov edx, OFFSET buffer
    call WriteString
    call Crlf
    jmp terminar

errorCerrar:
    mov eax, handle
    call CloseFile

errorArchivo:
    mov edx, OFFSET errorMsg
    call WriteString
    call Crlf

terminar:
    exit
main ENDP
END main
