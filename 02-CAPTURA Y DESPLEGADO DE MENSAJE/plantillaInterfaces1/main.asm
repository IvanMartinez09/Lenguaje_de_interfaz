;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;PRACTICA: Captura y desplegado de mensajes
;descripcion: Solicita un nombre al usuario, lo almacena en un buffer y lo muestra en pantalla.

INCLUDE Irvine32.inc

.data
    mensaje BYTE "Escribe tu nombre: ",0
    nombre BYTE 15 DUP(0) ;reservamos un espacio de 15 bytes en memoria, e inicializados en 0

.code
main PROC

    ;mostramos el mensaje para solicitar el nombre

    mov edx, OFFSET mensaje 
    call WriteString

    
    mov edx, OFFSET nombre ;cambiamos el contenido de edx para que apunte al espacio reservado del noimbre
    mov ecx, SIZEOF nombre - 1 ;como tenemos 15 bytes, le decimos que capture maximo 14, por que el ReadString necesita un espacio para agregar el byte 0 al final de la cadena
    call ReadString
    call Crlf

    ; mostramos el nombre que ingresamos
    mov edx, OFFSET nombre
    call WriteString
    call Crlf

    exit

main ENDP
END main
