include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    fib1		dd  0; fib1 variable like in the py file
	fib2		dd	1; fib2 variable like in the py file
	num		dd	0; num variable like in the py file
	
section '.text' code readable executable
; ======================================
	
start:
	call read_hex; num
	mov [num], eax
	
	
	mov eax, [fib1];initial print
	call print_eax
	mov eax, [fib2]
	call print_eax
	
startLoop:
	mov eax, [fib1]
	mov ebx, [fib2]
	add eax,ebx ; temp = fib1 + fib2
	mov [fib1], ebx; fib1 = fib2
	mov [fib2], eax; fib2 = temp
	
	mov edx, [num];if fib2 > num:
	cmp edx, eax
	jl endCode
	
	call print_eax;print(fib2)
	
	jmp startLoop
endCode:

	push	0
	call	[ExitProcess]

include 'training.inc'

