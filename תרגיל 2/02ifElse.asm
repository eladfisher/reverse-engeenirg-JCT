include 'win32a.inc'

format PE console
entry start


	
section '.text' code readable executable
; ======================================
	
start:
	call read_hex
	mov ecx, eax
	call read_hex
	mov ebx, eax;num2
	mov eax, ecx;num1
	
	cmp eax,ebx
	jne ifelse ; if num1==num2
	
	mov eax, 1
	call print_eax;print(1)
	jmp endCode
ifelse: ;else
	xor eax, eax;eax = 0
	call print_eax;print(0)
endCode:
	push	0
	call	[ExitProcess]

include 'training.inc'

