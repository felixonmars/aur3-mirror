# Fixed by CYB3R (dima@golovin.in)

ARCH=$(shell getconf LONG_BIT)

CPP_FLAGS_32 = -m32
CPP_FLAGS_64 = -m64

CPP = gcc
CPP_FLAGS = $(CPP_FLAGS_$(ARCH)) -Wall -g -O3 -fPIC -DINTEL_FIX

LD_FLAGS = -g -lGL -ldl -lpthread -lX11 $(CPP_FLAGS_$(ARCH))

PROGRAM = rgl.so

all:    $(PROGRAM)

%.o: %.c
	$(CPP) -c $(CPP_FLAGS) $<

$(PROGRAM):     $(patsubst %.c,%.o,$(wildcard *.c))
	$(CPP) $(LD_FLAGS) $^ -shared -fPIC -o $@

clean: 
	rm -f *.o *.so $(PROGRAM) *.core

