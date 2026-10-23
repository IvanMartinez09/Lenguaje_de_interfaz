;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;PRACTICA: 12- DESPLAZAMIENTO Y ROTACION
;DESCRIPCION:  Realiza desplazamientos de bits hacia la izquierda y derecha utilizando SHL, SHR y SAR, para observar los cambios en los registros y el comportamiento del bit de signo.



INCLUDE Irvine32.inc

.data

.code
main PROC

    mov eax, 0
    mov ebx, 0

    mov ecx, 0
    mov edx, 0
; 1. SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA
    mov al, 00001100b
    shl al, 1

    call WriteBin
        call DumpRegs


     ; 2. SHR: DESPLAZAR UNA POSICION A LA DERECHA
    mov al, 00001101b
    shr al, 1

    call WriteBin


   ; 3. SAR: DESPLAZAMIENTO CONSERVANDO EL SIGNO
    mov al, 8
    sar al, 1

    call WriteBin
    call DumpRegs


        ; 4. SAR: DIVISION CON RESIDUO
    mov al, 9
    sar al, 1

        call WriteBin
    call DumpRegs


    ; 5. SHL: DESPLAZAR DOS BITS CON UNA CONSTANTE
    mov al, 00001111b
    shl al, 2

    call WriteBin
    call DumpRegs


    ; 6. SHR: DESPLAZAR DOS BITS UTILIZANDO CL
    mov al, 00001111b
    mov cl, 2
    shr al, cl

    call WriteBin
    call DumpRegs

; 7. ROTACIONES: ROL, ROR, RCL Y RCR

    ; ROL: ROTAMOS LOS BITS HACIA LA IZQUIERDA
    mov al, 10000001b
    rol al, 1

    call WriteBin
    call DumpRegs

    ; ROR: ROTAMOS LOS BITS HACIA LA DERECHA
    mov al, 10000001b
    ror al, 1

    call WriteBin
    call DumpRegs

    ; RCL: ROTAMOS A LA IZQUIERDA UTILIZANDO CF
    mov al, 10000001b
    test al, al
    rcl al, 1

    call WriteBin
    call DumpRegs

    ; RCR: ROTAMOS A LA DERECHA UTILIZANDO CF
    mov al, 10000001b
    test al, al
    rcr al, 1

    call WriteBin
    call DumpRegs

    exit

main ENDP
END main
