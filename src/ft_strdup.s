global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

section .text

ft_strdup:
    push rdi            

    call ft_strlen
    inc rax

    mov rdi, rax
    call malloc

    test rax, rax
    jz .err

    mov rdi, rax
    pop rsi
    call ft_strcpy
    ret

.err:
    pop rdi
    xor rax, rax
    ret