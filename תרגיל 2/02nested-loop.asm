include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    num		dd  0; num variable like in the py file
	i		dd	1; i variable like in the py file
	j		dd	1; j variable like in the py file
	
section '.text' code readable executable
; ======================================
	
start:
	call read_hex; num
	inc eax
	mov [num], eax
	mov ecx, [i]
	
outerLoop:
	
	mov eax, 1
	
innerLoop:

	
	call print_eax; print(j)
	inc eax;inc for the next value
	
	mov ebx, ecx; check if ecx == eax+1
	inc ebx
	cmp ebx,eax
	jne innerLoop ; ifTrue start a new loop, else continue
	
endInnerLoop:
	inc ecx
	;check if edx(num) +1 != ecx(i)
	mov edx, [num]
	cmp ecx,edx
	jne outerLoop
endouterLoop:
	push	0
	call	[ExitProcess]

include 'training.inc'

