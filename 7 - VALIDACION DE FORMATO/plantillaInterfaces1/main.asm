;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
; practica: VALIDACION DE FORMATO 
; DESCRIPCION: Captura una cadena y verifica que cumpla el formato de tres letras, un guion y tres números




INCLUDE Irvine32.inc

.data
    mensaje BYTE "Ingresa el codigo (ejemplo: TEC-123): ",0
    msgValido BYTE "Formato valido",0
    msgInvalido BYTE "Formato invalido",0

    codigo BYTE 20 DUP(0)

.code
main PROC

    mov edx, OFFSET mensaje  ;solicitamos el codigo

    call WriteString

    ; capturamos el codigo ingresado
    mov edx, OFFSET codigo
    mov ecx, SIZEOF codigo - 1
    call ReadString

    
    cmp eax, 7; comprobamos que tenga 7 caracteres
    jne invalido

   
    mov esi, OFFSET codigo ; revisamos las letras
    mov ecx, 3

validarLetras:
    ; se valida que sean letras de la A a la Z
    mov al, [esi]
    cmp al, 'A'
    jb invalido
    cmp al, 'Z'
    ja invalido

    inc esi
    loop validarLetras

    ; Validamos el guion
    mov al, [esi]
    cmp al, '-'
    jne invalido

    inc esi

   
    mov ecx, 3; revisamos los 3 numeros

validarNumeros:
    mov al, [esi]
    cmp al, '0'
    jb invalido
    cmp al, '9'
    ja invalido

    inc esi
    loop validarNumeros

    ; si cumple todo, mostramos que es valido
    mov edx, OFFSET msgValido
    call WriteString
    jmp fin

invalido:
    mov edx, OFFSET msgInvalido
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main
