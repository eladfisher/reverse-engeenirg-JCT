include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
	result dd ?
	a dd 10
	b dd 10
	

	
section '.text' code readable executable
start:
; ======================================
	;call read_hex
	;mov ebx, eax; ebx = a
	
	;call read_hex
	;mov ecx, eax; ecx = b
	
	push [a]
	push [b]
	push result
	call myMul
	mov eax, [result]
	call print_eax
	
	jmp endProgram
	
; ====================================

myMul:
	push 	ebp
	mov		ebp, esp
	
	mov eax, [ebp+16] ; [a]
	mov ebx, [ebp+12] ; [b]
	mul ebx
	mov ebx,[ebp+8] ; result = a
	mov [ebx], eax
	

	pop 	ebp
	ret 	12

endProgram:
	push	0
	call	[ExitProcess]

include 'training.inc'

