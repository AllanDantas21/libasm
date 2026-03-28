NAME := libasm.a
NASM := nasm
AR := ar
NASMFLAGS := -f elf64

SRC_DIR := src

SRCS := \
	$(SRC_DIR)/ft_strlen.s

OBJS := $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) rcs $(NAME) $(OBJS)

$(SRC_DIR)/%.o: $(SRC_DIR)/%.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
