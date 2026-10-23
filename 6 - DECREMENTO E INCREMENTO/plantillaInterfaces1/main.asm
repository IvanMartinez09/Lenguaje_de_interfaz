;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;practica: decremento e incremento
;DESCRIPCION: Utiliza INC y DEC para aumentar y disminuir valores mediante ciclos



INCLUDE Irvine32.inc

.data
    msgPIN BYTE "Ingrese el PIN: ",0
    msgIntentos BYTE "Intentos restantes: ",0
    msgError BYTE "PIN incorrecto.",0
    msgAcceso BYTE "Acceso permitido.",0
    msgBloqueado BYTE "Autodestruccion comenzada...",0

    pinCorrecto = 1234

.code

main PROC

    mov ebx, 3        ; numero de intentos disponibles

intentar:

    ;solicitamos el PIN al usuario 
    mov edx, OFFSET msgPIN
    call WriteString

    call ReadInt ;lo leemos y guardamos en EAX

    cmp eax, pinCorrecto ;comparamos el PIN ingresado con el correcto

    je acceso ;Si son iguales, saltamos al bloque acceso

    ; PIN incorrecto
    mov edx, OFFSET msgError
    call WriteString
    call Crlf

    dec ebx ; restamos un intento disponible

    ; Si ya no quedan intentos
    jz bloqueado

    mov edx, OFFSET msgIntentos
    call WriteString

    mov eax, ebx
    call WriteDec
    call Crlf

    jmp intentar    ;egresamos al bloque intentar para pedir nuevamente el PIN


acceso:

    mov edx, OFFSET msgAcceso ; mostramos el mensaje de acceso permitido
    call WriteString
    call Crlf

    jmp fin ;saltamos al final del programa

bloqueado:
       ; se agotaron los 3 intentos disponibles
    mov edx, OFFSET msgBloqueado
    call WriteString
    call Crlf

fin:

    exit

main ENDP

END main