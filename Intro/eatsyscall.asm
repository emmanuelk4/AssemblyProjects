; Executable name	: EATSYSCALL
; Version 		 	: 1.0
; Created date		: 20/07/2020
; Last Update		: 20/07/2020
; Author			: Murage Kibicho
; Description 		: Demonstrate use of LINUX INT 80H syscalls to display 
;					  text
; Build using 		: nasm -f elf -g -F stabs eastsyscall.asm
;						ld -o eatsyscall eatsyscall.o

SECTION .data		; Section containing initialized data

EatMsg: db "Eat at Murage's",10
EatLen: equ $-EatMsg

SECTION .bss		; Section containing uninitialized data
SECTION .text		; Section containing code

global _start		; Linker needs this to find entry point

_start: 
		nop			; Keeps GDB happy
		mov eax,4 	; Specify sys_write system call
		mov ebx,1 	; Specify File Descriptor 1: Std output
		mov ecx,EatMsg; Pass offset of the mesage
		mov edx,EatLen; Pass length of message
		int 80H		; Make syscall to output text to stdout

		mov eax,1	; Specify exot sys_call
		mov ebx,0	; Return code 0
		int 80H 	; Terminate program