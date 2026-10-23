;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;PRACTICA: 5.1 REPETIR HASTA QUE EL USUARIO INGRESE 0
;DESCRIPCION :   ; Este programa solicita numeros y los muestra en pantalla hasta que el usuario ingrese cero para terminar el ciclo.




INCLUDE Irvine32.inc

.data
    mensaje BYTE "Ingresa un numero (0 para salir): ", 0

.code
main PROC

  

ciclo:
    ; Solicitamos un numero al usuario
    mov edx, OFFSET mensaje
    call WriteString
    call ReadInt

    ; Comparamos el numero ingresado con cero
    cmp eax, 0
    je fin

    ; Mostramos el numero y repetimos el ciclo
    call WriteInt
    call Crlf
    jmp ciclo

fin:
    exit

main ENDP
END main
