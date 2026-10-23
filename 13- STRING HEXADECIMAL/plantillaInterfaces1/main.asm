;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: JOSE LUIS MEDINA JIMENEZ
;PRACTICA: 13 - STROING HEXADECIMAL
;DESCRIPCION:convierte un numero a una cadena hexadecimal, separando sus digitos y guardandolos como caracteres ASCII en un buffer para despues mostrarlos en pantalla. 


INCLUDE Irvine32.inc

.data
    buffer BYTE "00000000", 0
    mensaje BYTE "El numero en hexadecimal es: ", 0

.code
main PROC

    mov eax, 02A3F9Ch
    mov esi, OFFSET buffer

    ; Empezamos desde la ultima posicion del buffer
    ; para guardar los digitos de derecha a izquierda
    add esi, 7
    mov ecx, 8

convertirHex:

    ; Obtenemos los ultimos 4 bits del numero
    mov ebx, eax
    and ebx, 0Fh

    ; Comprobamos si el digito corresponde a un numero o una letra
    cmp bl, 9
    jbe esNumero

    ; Convertimos los valores de 10 a 15 en letras de A a F
    sub bl, 10
    add bl, 'A'
    jmp guardarCaracter

esNumero:
    ; Convertimos los valores de 0 a 9 en caracteres ASCII
    add bl, '0'

guardarCaracter:

    ; Guardamos el caracter en el buffer y retrocedemos una posicion
    mov [esi], bl
    dec esi

    ; Desplazamos el numero para obtener el siguiente digito
    shr eax, 4
    loop convertirHex

    ; Mostramos el numero convertido a cadena hexadecimal
    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit

main ENDP
END main
