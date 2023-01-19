include 'win32a.inc'

format PE console
entry start


	
section '.text' code readable executable
; ======================================
	
start:
	call read_hex; num
	mov ebx, 0 ; total
	mov ecx, eax
	inc ecx
	
startLoop:
	add ebx, eax
	dec eax
	loop startLoop
	
	mov eax,ebx
	call print_eax;print(0)
endCode:
	push	0
	call	[ExitProcess]

include 'training.inc'

