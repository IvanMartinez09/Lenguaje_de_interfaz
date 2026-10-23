;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;PRACTICA: OPERACIONES LOGICAS
;DESCRIPCION: En este programa vimos operaciones logicas AND, OR, XOR, NOT y TEST para activar e invertir los bits que representan los estados de encendido, alarma y conexion de un equipo.



INCLUDE Irvine32.inc

.data
    msgActiva BYTE "Alarma activa",0
    msgInactiva BYTE "Alarma inactiva",0

.code
main PROC

    ; BIT 0 - ENCENDIDO
    ; BIT 1 - ALARMA
    ; BIT 2 - CONECTADO
    ; ESTADO INICIAL: 00000101

    ; 1. AND: EXTRAER ESTADO DE ENCENDIDO
    mov eax, 0
    mov ebx, 0
    mov al, 00000101b
    mov bl, al
    and bl, 00000001b

    call DumpRegs
    nop


    ; 2. OR: ACTIVAR LA ALARMA
    mov al, 00000101b
    or al, 00000010b

    call DumpRegs
    nop


    ; 3. XOR: CAMBIAR DOS VECES LA CONEXION
    xor al, 00000100b

    call DumpRegs
    nop

    xor al, 00000100b

    call DumpRegs
    nop


    ; 4. NOT: INVERTIR TODOS LOS BITS
    not al

    call DumpRegs
    nop


    ; 5. TEST: COMPROBAR EL ESTADO DE LA ALARMA
    test al, 00000010b
    jz sinAlarma

    mov edx, OFFSET msgActiva
    call WriteString
    jmp fin

sinAlarma:
    mov edx, OFFSET msgInactiva
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main
