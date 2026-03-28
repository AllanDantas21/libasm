section .text
global ft_strlen

ft_strlen:
    mov rax, 0
    cmp rdi, 0
    je  end

loop:
    cmp byte [rdi + rax], 0
    je  end
    inc rax
    jmp loop

end:
    ret