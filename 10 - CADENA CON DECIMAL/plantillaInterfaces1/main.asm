;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
; PRACTICA: CADENA CON DECIMAL
; DESCRIPCION: Calcula el avance de descarga de un archivo y convierte los resultados numéricos a cadenas decimales

INCLUDE Irvine32.inc

.data
    totalArchivo DWORD 100000
    bloques DWORD 125
    tamBloque DWORD 512

    descargados DWORD ?
    pendientes DWORD ?
    porcentaje DWORD ?
    grupos DWORD ?
    residuo DWORD ?

    msgDescargados BYTE "Bytes descargados: ",0
    msgPendientes BYTE "Bytes pendientes: ",0
    msgPorcentaje BYTE "Porcentaje de avance: ",0
    msgGrupos BYTE "Grupos de 1024 bytes: ",0
    msgResiduo BYTE "Bytes restantes del grupo: ",0

    bufferDecimal BYTE 11 DUP(0)

.code
main PROC

    ; calculamo los bytes descargados multiplicando la cantidad de bloques por su tamaño
    mov eax, bloques
    mov ebx, tamBloque
    mul ebx
    mov descargados, eax

    ; calculamos los bytes pendientes restando los descargados al tamaño total del archivo
    mov eax, totalArchivo
    sub eax, descargados
    mov pendientes, eax

    ; Calculamos el porcentaje de avance con los bytes descargados y el tamaño total
    mov eax, descargados
    mov ebx, 100
    mul ebx
    mov ebx, totalArchivo
    div ebx
    mov porcentaje, eax

    ; Dividimos los bytes descargados entre el tamaño de cada grupo para obtener grupos y residuo
    mov eax, descargados
    mov edx, 0
    mov ebx, 1024
    div ebx
    mov grupos, eax
    mov residuo, edx


    ; convertimos y mostramos los bytes descargados
    mov edx, OFFSET msgDescargados
    call WriteString

    mov eax, descargados
    mov esi, OFFSET bufferDecimal
    call convertirDecimal

    mov edx, OFFSET bufferDecimal
    call WriteString
    call Crlf


    ; convertimos y mostramos los bytes pendientes
    mov edx, OFFSET msgPendientes
    call WriteString

    mov eax, pendientes
    mov esi, OFFSET bufferDecimal
    call convertirDecimal

    mov edx, OFFSET bufferDecimal
    call WriteString
    call Crlf


    ; convertimos y mostramos el porcentaje de avance
    mov edx, OFFSET msgPorcentaje
    call WriteString

    mov eax, porcentaje
    mov esi, OFFSET bufferDecimal
    call convertirDecimal

    mov edx, OFFSET bufferDecimal
    call WriteString
    call Crlf


    ; convertimos y mostramos los grupos completos
    mov edx, OFFSET msgGrupos
    call WriteString

    mov eax, grupos
    mov esi, OFFSET bufferDecimal
    call convertirDecimal

    mov edx, OFFSET bufferDecimal
    call WriteString
    call Crlf


    ; convertimos y mostramos el residuo del agrupamiento
    mov edx, OFFSET msgResiduo
    call WriteString

    mov eax, residuo
    mov esi, OFFSET bufferDecimal
    call convertirDecimal

    mov edx, OFFSET bufferDecimal
    call WriteString
    call Crlf

    exit

main ENDP


; Procedimiento para convertir un numero a cadena decimal
convertirDecimal PROC

    mov ebx, 10
    mov ecx, 0

obtenerDigitos:

    ; dividimos el numero entre diez y guardamos los residos en la pila
    mov edx, 0
    div ebx

    push edx
    inc ecx

    cmp eax, 0
    jne obtenerDigitos

guardarDigitos:

    ; Recuperamos los digitos, los convertimos a ASCII y los guardamos en el buffer
    pop edx
    add dl, '0'

    mov [esi], dl
    inc esi

    loop guardarDigitos

    ; agregamos el terminador de la cadena
    mov BYTE PTR [esi], 0

    ret

convertirDecimal ENDP

END main

