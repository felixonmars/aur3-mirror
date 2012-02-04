all:
	gcc `pkg-config pidgin --cflags --libs` --shared -Wall -O2 attentionbutton.c -o attentionbutton.so -fPIC
clean:
	rm *.o *.a *.so
