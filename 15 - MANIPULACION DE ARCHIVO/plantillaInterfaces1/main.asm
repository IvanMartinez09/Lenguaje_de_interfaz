;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr.JOSE LUIS MEDINA JIMENEZ
;PRACTICA: 15- MANIPULACION DE DATOS
;DESCRIPCION:  ; Crea un archivo de texto, guarda un dato y comprueba que se haya escrito correctamente.
 



INCLUDE Irvine32.inc

.data                           
    nombreArchivo BYTE "Inventario.txt", 0 ; Asignamos el nombre del archivo y como no definimos una ruta, lo va guardar en la carpeta del main
    texto BYTE "125", 0  ;Este es el valor que vamos almacenar
    archivoHandle DWORD ?

    mensajeExito BYTE "Archivo guardado", 0
    mensajeError BYTE "No se guardo el archivo correctamente",0


.code      
main PROC                       

    ;1. CREA EL ARCHIVO
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile
    
    cmp eax, INVALID_HANDLE_VALUE
    je error 
    
    mov archivoHandle, eax

    ;2.ESCRIBIR TEXTO

    mov eax, archivoHandle
    mov edx, OFFSET texto
    mov ecx, SIZEOF texto - 1
    call WriteToFile

    jc errorEscritura


    cmp eax, SIZEOF texto - 1
    jne errorEscritura

    ;3. CERRAR ARCHIVO TXT

    mov eax, archivoHandle
    call CloseFile

    test eax, eax ;Comparamos el valor por que tiene que ser diferente de 0 para ver si hubo un error o no.
    jz error
    
    mov edx, OFFSET mensajeExito
    call WriteString
    jmp fin


errorEscritura:
    ; Cerramos el archivo si ocurre un error al escribir

    mov eax, archivoHandle
    call CloseFile
error:
    ; Mostramos el mensaje de error

    mov edx, OFFSET mensajeError
    call WriteString
fin:    
    exit                        ;Exit program
main ENDP
END main