#obj-m := secbulk.o
#secbulk-m := secbulk.o
NAME=dnw
ALL:$(NAME)
	
$(NAME):$(NAME).c $(NAME).o
	$(CC) -o $(NAME) $(CFLAGS) $(NAME).c 
clean:
	-rm -f $(NAME) $(NAME).o
