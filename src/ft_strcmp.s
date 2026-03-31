section .text
global ft_strcmp

ft_strcmp:
    test rdi, rdi
    jz   return_null
    test rsi, rsi
    jz   return_null

.loop:
    movzx rax, byte [rdi]
    movzx rdx, byte [rsi]
    
    sub rax, rdx
    jnz .done
    
    cmp byte [rdi], 0
    jz  .done
    
    inc rdi
    inc rsi
    jmp .loop

.done:
    ret

return_null:
    xor rax, rax
    ret