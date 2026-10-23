;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: JOSE LUIS MEDINA JIMENEZ



INCLUDE Irvine32.inc

    
.code
main PROC
    ; OPERACIONES: ADD Y SUB

    mov eax,50 ;Asignamos 50 en eax
    mov ebx, 20 ; asignamos 20 en ebx

    add eax,ebx ; sumamos 50 mas 20 = 70
    sub eax, 15 ; restamos 70-15 = 55
    
    nop

    ; 2. CF: ACARREO EN UNA SUMA SIN SIGNO

    mov eax, 0 
    mov al, 255  ;valor maximo de 8 bits sin signo 
    add al, 1 ;sumamos 1, al queda en 0 y CF = 1

    nop
    
    ; 3. OF: CONDICION DE DESBORDAMIENTO
    mov eax, 0
    mov al, 127 ; valor maximo de 8 bits con signo
    add al, 1

    nop

    ; 4. MUL: MULTIPLICACION DE VALORES DE 32 BITS

    mov eax, 25 
    mov ebx, 3

    mul ebx ; multiplicmos 25 * 3 = 75
    
    nop

    ;5. MUL: PRODUCTO QUE NECESITA MAS DE 32 BITS

    mov eax, 65537
    mov ebx, 65537

    mul ebx

    nop

    ;6: IMUL: MULTIPLICACION CON SIGNO 

    mov eax, -5
    
    imul eax,eax, 3

    nop

    ;7: DIVISION SIN SIGNO

    mov eax, 125
    mov edx, 0 ; limpia la parte del dividendo
    mov ebx, 12 ; divisor

    div ebx

    nop

    ; IDIV: DIVISION CON SIGNO
    
    mov eax, -125 ; numero negativo que vamos a dividir

    cdq ; poniemos el signo de eax a edx

    mov ebx, 12 ; divisor

    idiv ebx
    
    nop

    
main ENDP 

END main
