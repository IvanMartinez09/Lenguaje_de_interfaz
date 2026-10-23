;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
; PRATICA: PUSH Y POP
; DESCRIPCION: Utiliza la pila para guardar y recuperar valores, conservar registros y ejecutar procedimientos



INCLUDE Irvine32.inc

.code
main PROC
    ; BLOQUE 1: PUSH Y POP

    mov eax, 500 ; guardamos 500 en eax

    push eax ;mandamos a la pila una copia de eax
    nop
    
    mov ebx, 0 ;inicializamos en 0 

    pop ebx; recupera el 500 de la pila en EBX
    
    nop

    ; BLOQUE 2: ORDEN LIFO 

    mov eax, 10
    push eax 

    mov eax,20
    push eax

    nop

    mov eax,30 ;guardamos 30 encima del 20
    push eax

    ;recuperamos los valores en orden inverso

    pop eax
    pop ebx
    pop ecx

    nop

    ; BLOQUE 3: CONSERVAR REGISTROS

    mov eax,100
    mov ebx, 200

    ; guardamos ambos valores originales en la pila
    push eax
    push ebx

    ; modificamos temporalmente los registros
    mov eax, 999
    mov ebx, 888

    ; recuperamos los valores originales
    pop ebx
    pop eax

    ; BLOQUE 4: CALL Y RET
    
    mov eax,50
    mov ebx, 666

    call aumentarDiez ; llamamos al procedimiento aumentarDiez

    nop

    exit
aumentarDiez PROC  ;inicia el bloque del procedimiento
    nop
    push ebx  ; guardamos EBX para conservar su valor

    nop
        ; sumamos 10 al valor que contiene EAX
    mov ebx, 10
    add eax, ebx

    nop

    pop ebx ; recuperamos el valor original de EBX

    nop

    ret


aumentarDiez ENDP
main ENDP

END main