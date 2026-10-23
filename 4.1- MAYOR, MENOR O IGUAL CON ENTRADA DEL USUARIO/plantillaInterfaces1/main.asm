;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;practica: 4.1 MAYTOR, MENOR, O IGUAL CON ENTRADA DEL USUARIO
;descripcion: Este programa solicita dos numeros al usuario y los compara para determinar si el primero es mayor, menor o igual al segundo, utilizando comparaciones y saltos condicionales






INCLUDE Irvine32.inc

.data
    ; Mensajes para ingresar los numeros
    msgIngresar1 BYTE "Ingresa el primer valor: ", 0
    msgIngresar2 BYTE "Ingresa el segundo valor: ", 0

    ; Mensajes para mostrar el resultado
    msgMayor BYTE "El primer numero es mayor.", 0
    msgMenor BYTE "El primer numero es menor.", 0
    msgIguales BYTE "Los numeros son iguales.", 0

.code
main PROC

    ; Solicitamos el primer numero y lo guardamos en ECX
    mov edx, OFFSET msgIngresar1
    call WriteString
    call ReadInt
    mov ecx, eax

    ; Solicitamos el segundo numero y lo guardamos en EBX
    mov edx, OFFSET msgIngresar2
    call WriteString
    call ReadInt
    mov ebx, eax

    ; Comparamos el primer numero con el segundo
    mov eax, ecx
    cmp eax, ebx

    ; Verificamos si el primero es mayor o menor
    jg mayor
    jl menor

    ; Si no es mayor ni menor, los numeros son iguales
    mov edx, OFFSET msgIguales
    call WriteString
    jmp fin

mayor:
    ; Mostramos el mensaje cuando el primero es mayor
    mov edx, OFFSET msgMayor
    call WriteString
    jmp fin

menor:
    ; Mostramos el mensaje cuando el primero es menor
    mov edx, OFFSET msgMenor
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main
