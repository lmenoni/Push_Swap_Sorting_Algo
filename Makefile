NAME = push_swap
SRC_DIR = src
SOURCES = \
	push_swap.c list_utils.c push.c reverse_rotate.c rotate.c swap.c check.c \
	algo.c set_data.c algo_utils.c

OBJDIR = obj
OBJECTS = $(addprefix $(OBJDIR)/, $(SOURCES:.c=.o))
SRCS = $(addprefix $(SRC_DIR)/, $(SOURCES))

CC = cc
CFLAGS = -Wall -Wextra -Werror -g
LDFLAGS = my_libft/mylibft.a

MY_LIBFT_DIR = my_libft
MY_LIBFT = $(MY_LIBFT_DIR)/mylibft.a

$(MY_LIBFT):
	@$(MAKE) -C $(MY_LIBFT_DIR) > /dev/null 2>&1

all: $(MY_LIBFT) $(NAME)
	@echo "✓ Compilazione completata: $(NAME)"

$(NAME): $(OBJECTS)
	@echo "📦 Linking $(NAME)..."
	@$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@
	@chmod +x $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: $(SRC_DIR)/%.c | $(OBJDIR)
	@echo "⚙️  Compilando $(patsubst $(SRC_DIR)/%,%,$<)..."
	@$(CC) $(CFLAGS) -I$(SRC_DIR) -c $< -o $@ 2>&1 || (echo "❌ Errore nella compilazione di $<"; exit 1)

clean:
	@echo "🧹 Pulizia file oggetto..."
	@rm -rf $(OBJDIR)
	@$(MAKE) -C $(MY_LIBFT_DIR) clean > /dev/null 2>&1
	@echo "✓ Pulizia completata"

fclean: clean
	@echo "🗑️  Rimozione eseguibile..."
	@rm -f $(NAME)
	@$(MAKE) -C $(MY_LIBFT_DIR) fclean > /dev/null 2>&1
	@echo "✓ Fclean completato"

re: fclean all

.PHONY: all clean fclean re