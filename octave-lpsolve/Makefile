MKOCTFILE ?= mkoctfile
CFLAGS := -I/usr/include/lpsolve -DOCTAVE

OBJ = hash.o octave.o lpsolve.o
DEPS = hash.h lp_explicit.h lpsolvecaller.h octave.h

all: octlpsolve.oct

%.o: %.cpp $(DEPS)
	$(MKOCTFILE) -c -s -o $@ $< $(CFLAGS)

octlpsolve.oct: $(OBJ)
	$(MKOCTFILE) -o $@ $^ 

clean:
	$(RM) *.o core octave-core *.oct *~
