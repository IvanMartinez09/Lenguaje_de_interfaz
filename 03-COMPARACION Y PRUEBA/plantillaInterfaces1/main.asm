;MATERIA: LENGUAJE DE INTERFACES
;ALUMNO: JESUS IVAN MARTINEZ REYES
;HORARIO: 8:00 - 9:00 AM
;DOCENTE: Dr. JOSE LUIS MEDINA JIMENEZ
;practica: COMPARACION Y PRUEBA
;dESCRPICION: Utiliza CMP y TEST para comparar valores y observar los cambios en las banderas del procesador

INCLUDE Irvine32.inc

.code 
	;CONDICION 1: ZEROFLAG

	main PROC 
	mov EBX , 1  ; guardamos el valor de 1 en ebx
	cmp ebx, 1   ;con el compare hacemos una resta al ebx 1-1=0
	call dumpRegs ;nos deja ver el estado de los registros y las banderas.

	mov EAX, 01h ; aqui guardamos el valor hexa 01 en eax
	cmp EAX, EBX  ;comparamos eax con ebx 
	call dumpRegs ; muestra que ZF esta activa

	mov cl, 1111111b ; asignamos el numero binario en cl
	cmp cl, cl      ;comparamos consigo mismo
	call dumpRegs   ; se activaria por que ambos son iguales

	; CONDICION 2: SINGFLAG
	;Limpiamos registros
	mov Eax, 0
	mov EBX, 0
	

	mov al, -5  ;Guardamos -5 en los 8 bits bajos de EAX
	mov bl, 1  ;guardamos 1 en los 8 bits bajos de EBX
	cmp al, bl  ;hacemos la comparacion y daria -6
	call dumpRegs 

	; CONDICION 3: CARRYFLAG
	mov EAX, 0
	mov EBX, 0

	mov al, 255 ;  guardamos el valor maximo de 8 bits sin signo
	add al, 1 ;Sumamos 1, provocando un acarreo

	call dumpRegs

	; CASO 4: OVERFLOWFLAG 
	mov EAX,0
	mov EBX, 0
	 
	mov al, -128  ;Guardamos el minimo valor de 8 bits con signo
	mov bl, 1    ; Guardamos el numero 1 en BL


	cmp al, bl  ;Comparamos -128 - 1 = -129
	call dumpRegs 



	; caso 5: TEST

	mov EAX, 0
	mov EAX, 5 ; 00000101b ; guardamos 5, que en binario es 00000101
	test EAX, 1 ;realizamos AND entre 5 y 1 sin guardar resultado
	call dumpRegs

	;00000101b
	;'
	;00000001b
	;---------
	;00000001b

	mov EAX, 0
	mov al, 10000000b  ;guarda el valor binario en AL
	test al, al
	call dumpRegs


main ENDP

END main