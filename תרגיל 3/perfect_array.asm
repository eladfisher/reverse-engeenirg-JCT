; Barak Gonen
; An array is perfect if it contains all the values starting from zero
; and incrementing by 1, with no value appearing twice (order not important)
; For example: 0, 2, 1 is perfect
; While 0, 2, 3 is not perfect, 0, 1, 1 is not perfect 

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    array		db 1,2,3,0,4
	array_len 	dd $-array
	bad_array	db "Array is no good", 13, 10, 0
	good_array	db "Perfect", 13, 10, 0
	
section '.text' code readable executable
; ======================================

check:
	; pointer to array, array_len, value to find
	;...
	push ebp; the ebp stuff
	mov ebp, esp
	
	
	sub		esp, 4
	
	;...
	push ebx;save the values of the registers
	push ecx
	push edx
	
	mov		eax, [ebp + 8]  ; value to find!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	mov		ecx, [ebp + 12] ;array_len == ???
	
	mov		ebx, [ebp + 16];the pointer to the array 
	mov		dword [ebp-4], 0;??? = 4
	xor		edx, edx
.loop:
	mov		dl, byte [ebx+ecx-1]
	cmp		edx, eax
	je		.found
	loop	.loop
.not_found:
	mov		dword [ebp-4], 0
	jmp		.done
.found:
	mov		dword [ebp-4], 1
.done:
	mov		eax, [ebp-4]
	
	pop		edx
	pop		ecx
	pop		ebx
	;...    ; add esp,4?
	add esp,4
	
	pop		ebp
	ret		12
	
start:
	mov		ecx, [array_len]
	xor		ebx, ebx
check_element:
	push	array			; array address
	push	[array_len]			; array length
	push	ebx			; value to search
	call	check
	cmp		eax, 0
	je		bad
	inc		ebx
	loop	check_element
good:
	mov		esi, good_array
	call	print_str
	jmp		done
bad:
	mov 	esi, bad_array
	call	print_str
	
done:
	push	0
	call	[ExitProcess]

include 'training.inc'

