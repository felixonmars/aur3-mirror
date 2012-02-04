include Make.inc

all: libatlas.so libf77blas.so libcblas.so libblas.so liblapack.so.3.4.0


libatlas.so: libatlas.a
	ld $(LDFLAGS) -shared -soname $@ -o $@ --whole-archive libatlas.a \
	   --no-whole-archive -lc $(LIBS)

libf77blas.so : libptf77blas.a libatlas.so
	ld $(LDFLAGS) -shared -soname libblas.so.3 -o $@ --whole-archive \
	   libptf77blas.a --no-whole-archive $(F77SYSLIB) -L. -latlas

libcblas.so : libptcblas.a libatlas.so
	ld $(LDFLAGS) -shared -soname libcblas.so -o $@ --whole-archive \
	   libptcblas.a -L. -latlas

libblas.so: libf77blas.so
	ln -s $< $@

liblapack.so.3.4.0 : liblapack.a libcblas.so libblas.so
	ld $(LDFLAGS) -shared -soname liblapack.so.3 -o $@ --whole-archive \
	   liblapack.a --no-whole-archive $(F77SYSLIB) -L. -lcblas -lblas -lgcc_s
