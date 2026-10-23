;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;PRACTICA: CAPTURA Y ALMACENAMIENTO DE DATO NUMERICO.
;dESCRIPCRION:  Este programa captura la cantidad de unidades recibidas, valida que sea un numero dentro del rango permitido, la suma a la existencia actual del almacen. y convierte el resultado a cadena y lo muestra.




INCLUDE Irvine32.inc

.data
    mensajeEntrada BYTE "Cuantas unidades llegaron (1-99): ", 0
    mensajeError BYTE "Entrada invalida. Ingresa un numero del 1 al 99.", 13, 10, 0
    mensajeResultado BYTE "Existencia actual: ", 0
    mensajeUnidades BYTE " unidades", 13, 10, 0

    entrada BYTE 16 DUP(0)     ; Espacios para guardar la entrada y el resultado convertido
    salida BYTE 11 DUP(0) 


    cantidadRecibida DWORD ?
    existenciaActual DWORD 25  ; Variables para guardar la cantidad recibida y la existencia


.code
main PROC

solicitarEntrada:

    ; Solicitamos la cantidad que llego al almacen
    mov edx, OFFSET mensajeEntrada
    call WriteString

    mov edx, OFFSET entrada
    mov ecx, SIZEOF entrada - 1
    call ReadString

     ; EAX contiene la cantidad de caracteres ingresados, comprobamos que tenga uno o dos caracteres
    cmp eax, 1
    jb entradaInvalida
    cmp eax, 2
    ja entradaInvalida

    mov esi, OFFSET entrada
    mov ecx, eax
    mov ebx, 0

convertirDigitos:

    ; Validamos los caracteres y los convertimos de ASCII a numero
    mov eax, 0
    mov al, [esi]

    cmp al, '0'
    jb entradaInvalida
    cmp al, '9'
    ja entradaInvalida

    ; Multiplicamos lo acumulado por diez y sumamos el siguiente digito
    sub eax, '0'
    imul ebx, ebx, 10
    add ebx, eax

    inc esi
    loop convertirDigitos

    ; Verificamos que la cantidad este dentro del rango permitido
    cmp ebx, 1
    jb entradaInvalida
    cmp ebx, 99
    ja entradaInvalida

    ; Guardamos la cantidad y la sumamos a la existencia del almacen
    mov cantidadRecibida, ebx

    mov eax, existenciaActual
    add eax, cantidadRecibida
    mov existenciaActual, eax

    ; Convertimos la existencia actual a cadena y mostramos el resultado
    mov eax, existenciaActual
    mov edx, OFFSET salida
    call ConvertirDec

    mov esi, edx

    mov edx, OFFSET mensajeResultado
    call WriteString

    mov edx, esi
    call WriteString

    mov edx, OFFSET mensajeUnidades
    call WriteString

    exit

entradaInvalida:

    ; Si la entrada no cumple las condiciones, mostramos el error y regresamos a solicitar nuevamente la cantidad
    mov edx, OFFSET mensajeError
    call WriteString
    jmp solicitarEntrada

main ENDP


ConvertirDec PROC USES ebx esi

    ; Convertimos el numero a texto dividiendo entre diez
    ; y guardando los digitos desde el final del buffer
    mov esi, edx
    add esi, 10
    mov BYTE PTR [esi], 0
    mov ebx, 10

convertir:
; Dividimos el numero entre 10, EAX guarda el cociente y EDX el residuo
    mov edx, 0
    div ebx

    add dl, '0'   ; Convertimos el residuo a ASCII y lo guardamos en el buffer

    dec esi
    mov [esi], dl

    cmp eax, 0
    jne convertir

    ; Regresamos la direccion donde comienza la cadena
    mov edx, esi
    ret

ConvertirDec ENDP

END main
