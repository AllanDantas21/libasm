# libasm

> Ecole 42 project — reimplementing standard C library functions in x86-64 Assembly.

The goal is to understand how the machine works at the lowest level: registers,
the System V AMD64 ABI calling convention, memory addressing, and how everyday
C functions are actually built without any C allowed. Pure `.s` files compiled
with NASM into a static library. Syscall errors must be properly handled and
`errno` must be set accordingly.

---

## Functions

| Function | Reimplements | Notes |
|---|---|---|
| `ft_strlen` | `strlen(3)` | |
| `ft_strcpy` | `strcpy(3)` | |
| `ft_strcmp` | `strcmp(3)` | |
| `ft_write` | `write(2)` | syscall — errno handling required |
| `ft_read` | `read(2)` | syscall — errno handling required |
| `ft_strdup` | `strdup(3)` | may call `malloc` |

---

## Build

```bash
# Compile the library
make

# Compile and run the tests
make && gcc -o tests/test_ft_strlen tests/test_ft_strlen.c -L. -lasm
./tests/test_ft_strlen

# Clean
make clean   # objects only
make fclean  # objects + library
```

---

## Structure

```
libasm/
├── Makefile
├── include/
│   └── libasm.h
├── src/
│   └── ft_strlen.s
└── tests/
    └── test_ft_strlen.c
```

---

## Technical notes

- **Assembler**: NASM
- **Syntax**: Intel
- **Format**: ELF64 (Linux x86-64)
- **Inline ASM**: not allowed — only `.s` files
- **Flag**: `-no-pie` is forbidden
- **Calling convention**: System V AMD64 ABI