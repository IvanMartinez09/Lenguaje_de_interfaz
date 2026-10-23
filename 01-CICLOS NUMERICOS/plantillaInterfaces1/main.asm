;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr: JOSE LUIS MEDINA JIMENEZ
;PRACTICA: CICLOS NUMERICOS
;DESCRIPCION: Utiliza LOOP para repetir instrucciones y mostrar una cuenta regresiva.


INCLUDE Irvine32.inc

.data
    mensaje BYTE "Hola mundo",0

.code
main PROC

    
    mov ecx, 5   ;Declaramos el valor del contador

    jecxz fin_ciclo ; Si ECX es cero, saltamos al final

ciclo:    ;iniciamos el bloque que se repetira
    ; Mostramos el mensaje
    mov edx, OFFSET mensaje
    call WriteString
    call Crlf

    
    loop ciclo ; Repetimos el bloque mientras ecx sea diferente de cero

fin_ciclo:
    exit

main ENDP
END main
