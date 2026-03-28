section .text
global ft_strcpy

ft_strcpy:
    mov rax, 0
    cmp rdi, 0
    je  end
    cmp rsi, 0
    je  end

loop:
    mov dl, [rsi + rax]
    mov [rdi + rax], dl
    cmp byte [rsi + rax], 0
    je  end
    inc rax
    jmp loop

end:
    mov rax, rdi
    ret