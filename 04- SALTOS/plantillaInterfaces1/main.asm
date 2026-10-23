;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: DR. JOSE LUIS MEDINA JIMENEZ
;PRACTICA: SALTOS
;DESCRIPCION: Utiliza JMP para cambiar el orden de ejecución de las instrucciones.




INCLUDE Irvine32.inc

.code
main PROC

    
    mov eax, 5 ;asignamos el valor 5 en EAX

    jmp continuar ;saltamos a la etiqueta continuar

    mov eax, 10 ; esta linea no se ejecuta

continuar:
    
    call DumpRegs ; mostramos los registros

    exit

main ENDP
END main
