; ================================================================================
; This program takes an array of int input from user and computes the sum
; ================================================================================

%define MAX_SIZE 20

extern printf, scanf

segment .data
NL db 0xa
SPACE db 0x20
COLON db 0x3A

input_format db "%d",0
prompt_heading db "Enter a list of numbers to calculate the sum "
                db "(0 to get sum)",0xa,0
len_display db "The length of the array is %d",0xa,0
sum_display db "sum: %d", 0xa, 0
prompt_display db "#%d: ", 0
len db 0d
sum dd 0

segment .bss
array resd MAX_SIZE

segment .text
global sum_array


sum_array:
    push ebp
    
    push dword prompt_heading
    call printf                     ;print heading
    add esp, 4

    mov edx, array

.input_loop:
    mov ecx, MAX_SIZE
    cmp ecx, len
    je .loop_end

    push edx
    push dword input_format
    call scanf
    add esp, 4
    pop edx                     ; restore loop pointer

    cmp dword [edx], 0d
    je .loop_end                ; terminate loop on input zero

    add edx, 4
    add byte [len], 1d
    jmp .input_loop
.loop_end:
    call array_len

    ; calculate the sum of the array
    
    movzx ecx, byte [len]
    mov edx, array
    xor eax, eax
.sum:
    mov eax, dword [edx]
    add dword [sum], eax
    add edx, 4
    dec ecx
    jnz .sum

    push dword [sum]
    push dword sum_display
    call printf
    add esp, 8

exit:
    xor eax, eax
    pop ebp
    ret

array_len:
    enter 0,0
    movzx eax, byte [len]                ; prijnt length of arrays
    push eax
    push dword len_display
    call printf
    add esp,8
    leave
    ret

prompt:
    enter 0,0
    movzx eax, byte[len]
    push eax
    push dword prompt_display
    call printf
    add esp, 8
    leave
    ret