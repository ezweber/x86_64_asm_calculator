section .data
    prompt1 db "Enter a number", 10
    prompt2 db "Enter a second number", 10

section .bss
    num1 resb 32
    num2 resb 32
    result resb 32

section .text
    global _start

_start:
    call _printText1
    call _getNumber
    call _printText2
    call _getNumber2
    call _addNums

    ; Exit

    mov rax, 60
    mov rdi, 0
    syscall

_getNumber:
    mov rax, 0
    mov rdi, 0
    mov rsi, num1
    mov rdx, 32
    syscall
    ret

_getNumber2:
    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 32
    syscall
    ret

_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt1
    mov rdx, 15
    syscall
    ret

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt2
    mov rdx, 22
    syscall
    ret

_printNum:
    mov rax, 1
    mov rdi, 1
    mov rsi, num1
    mov rdx, 32
    syscall
    ret

_addNums:
    mov al, [num1]
    mov bl, [num2]
    sub al, '0'     ; Convert to decimal
    sub bl, '0'
    add al, bl
    add al, '0'     ; Convert to ascii
    mov [result], al

    ; Print result

    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 32
    syscall
    ret