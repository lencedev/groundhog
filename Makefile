##
## EPITECH PROJECT, 2023
## B-CNA-410-MPL-4-1-groundhog-owen1.bolling
## File description:
## Makefile
##

SRC	=	./source/

NAME	=	groundhog

$(NAME)	:
			cp $(SRC)main.py ./
			mv main.py groundhog
			chmod +x groundhog

all	:	$(NAME)

clean:
		rm -rf groundhog

fclean:	clean

re	:	fclean all