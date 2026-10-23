;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;PRACTICA: CONDICIONALES
;DESCRIPCION: Utiliza ciclos WHILE y DO-WHILE para mostrar números del 1 al 100


INCLUDE Irvine32.inc

.code
main PROC

;WHILE
    mov ebx, 1  ;iniciamos el contador en 1

ciclowhile:
    cmp ebx, 100  ;comparamos el contador con 100

    jg fin ;hacemos un salto al bloque fin, si ebx es mayor que 100

    ;mostramos el valor actual del contador
    mov eax, ebx 
    call WriteDec 
    call Crlf 

    ;incrementamos el contador y repetimos

    inc ebx 
    jmp ciclowhile 

fin:
    call Crlf 

    mov ebx, 1 ;reiniciamos el contador en 1

ciclodowhile:

    mov eax, ebx  ; mostramos el valor actual del contador
    call WriteDec 
    call Crlf 

    inc ebx ;incrementamos el contador

    cmp ebx, 100   ;comprobamos si debemos repetir

    jle ciclodowhile 

    exit 
main ENDP

END main