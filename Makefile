# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nguiard <nguiard@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/09 19:00:15 by nguiard           #+#    #+#              #
#    Updated: 2022/07/03 21:48:24 by nguiard          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC =	$(addsuffix .s,		\
		$(addprefix srcs/,	\
		main				\
		draw_cadre			\
		game_loop			\
		read_loop			\
		colone_len			\
		put_token			\
		put_in_array		\
		))

OBJ =	${SRC:srcs/%.s=obj/%.o}

NAME =	4asm

all:	$(NAME)

$(NAME): $(OBJ)
	@ld $(OBJ) -o $(NAME)
	@echo "compilation de ${NAME} terminee!"

obj/%.o:	srcs/%.s
	@nasm -f elf64 $< -o $@
	@printf "%s\r" $<

fclean:
	@rm -f $(NAME) $(OBJ)
	@echo "fclean termine!"

clean:
	@rm -f $(OBJ)
	@echo "clean termine!"

re: fclean all

.PHONY: re fclean clean all