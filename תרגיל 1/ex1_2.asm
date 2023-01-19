include 'win32a.inc'

format PE console
entry start

	
section '.text' code readable executable
; ======================================
	
	start:
	;fist use of mov and 0
    mov eax, 0
    ;use of logical and to make ebx 0:
	and ebx, eax
	; make a register that is 11111... and than not to make it 00000....
    sub ecx, ecx
	;use of xor
	xor edx, edx
    
	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

