;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr.JOSE LUIS MEDINA JIMENEZ
;PRACTICA: CONTROL DE OCUPACION DE UN ESTACIONAMINETO
; DESCRIPCION: Registra la entrada de vehículos y controla los espacios ocupados y disponibles de un estacionamiento


INCLUDE Irvine32.inc

.data
    msgEntrada BYTE "Ingrese cantidad de autos: ",0
    msgOcupados BYTE "Espacios ocupados: ",0
    msgDisponibles BYTE "Espacios disponibles: ",0
    msgLleno BYTE "Estacionamiento lleno",0
    msgExceso BYTE "No hay suficientes espacios disponibles",0
    msgInvalido BYTE "Cantidad invalida",0

    capacidad = 20
    ocupados DWORD 0
    disponibles DWORD 20

.code
main PROC

ingresar:

    
    mov edx, OFFSET msgEntrada ;solicitamos la cantidad de autos
    call WriteString
    call ReadInt

    
    cmp eax, 0 ;comprobamos que la cantidad sea mayor a 0
    jle invalido

   
    mov ebx, eax ;guardamos la cantidad que se ingreso

    ; verificamos si hay espacios suficientes
    cmp ebx, disponibles
    jg exceso

agregarAutos:

    ; aumentamos ocupados y disminuimos disponibles
    inc ocupados
    dec disponibles

    ; descontamos un auto de la cantidad ingresada
    dec ebx
    jnz agregarAutos

    ; mostramos los espacios ocupados
    mov edx, OFFSET msgOcupados
    call WriteString

    mov eax, ocupados
    call WriteDec
    call Crlf

    ; comprobamos si el estacionamiento esta lleno
    cmp disponibles, 0
    je lleno

    ; mostramos los espacios disponibles
    mov edx, OFFSET msgDisponibles
    call WriteString

    mov eax, disponibles
    call WriteDec
    call Crlf
    call Crlf

    jmp ingresar

exceso:

    mov edx, OFFSET msgExceso   ; no se permite ingresar mas autos que los disponibles

    call WriteString
    call Crlf
    call Crlf

    jmp ingresar

invalido:

    ; aqui rechazamos cantidades menores o iguales a 0
    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf
    call Crlf

    jmp ingresar



        ; se termina cuando se ocupan los 20 espacios
lleno:
    mov edx, OFFSET msgLleno 
    call WriteString
    call Crlf

    exit

main ENDP
END main
