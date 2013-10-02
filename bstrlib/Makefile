CFLAGS=-g -O2 -Wall -Wextra -Isrc -rdynamic -DNDEBUG $(OPTFLAGS)
LIBS=-ldl $(OPTLIBS)
PREFIX?=/usr

# we don't care for the C++ wrapper for now
# the bsafe module is somewhat of a pain if you link 
# bstrlib with other libraries, so we take it out
SOURCES=$(filter-out bsafe.c bstest.c testaux.c, $(wildcard *.c))
OBJECTS=$(patsubst %.c,%.o, $(SOURCES))
HEADER=$(filter-out bsafe.h bstrwrap.h, $(wildcard *.h))

# this is a bit unfortunate..
TARGET=build/libbstrlib.a
SO_TARGET=$(patsubst %.a,%.so,$(TARGET))

# The Target build
all: $(TARGET) $(SO_TARGET) tests
dev: CFLAGS=-g -Wall -Wextra $(OPTFLAGS)
dev: all

$(TARGET): CFLAGS += -fPIC
$(TARGET): build $(OBJECTS)
	ar rcs $@ $(OBJECTS)
	ranlib $@

$(SO_TARGET): $(TARGET) $(OBJECTS)
	$(CC) --shared -o $@ $(OBJECTS)

build:
	@mkdir -p build

bstest: LIBS += $(TARGET)
bstest: $(TARGET) 

testaux: LIBS += $(TARGET)
testaux: $(TARGET)

.PHONY: tests
tests: bstest testaux
	@echo Running bstest:
	@./bstest  | grep "test failures"
	@echo Running testaux:
	@./testaux | grep "test failures"

# The Cleaner
clean:
	rm -rf build $(OBJECTS) bstest testaux

# The Install
install: all
	install -d $(DESTDIR)/$(PREFIX)/lib/
	install -d $(DESTDIR)/$(PREFIX)/include/
	install -m644 $(TARGET) 	$(DESTDIR)/$(PREFIX)/lib/
	install -m644 $(SO_TARGET) 	$(DESTDIR)/$(PREFIX)/lib/
	install -m644 $(HEADER) 	$(DESTDIR)/$(PREFIX)/include/
