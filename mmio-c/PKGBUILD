# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
pkgname=mmio-c
pkgver=1.0
pkgrel=1
pkgdesc="ANSI C library for Matrix Market I/O build as shared library for linking with \"-lmmio\""
arch=('i686', 'x86_64')
url="http://math.nist.gov/MatrixMarket/mmio-c.html"
license=('unknown')

_exampledir="/usr/share/examples/mmio"
_libdir="/usr/lib"
_includesdir="/usr/include"

source=('http://math.nist.gov/MatrixMarket/mmio/c/mmio.h'
        'http://math.nist.gov/MatrixMarket/mmio/c/mmio.c'
        'http://math.nist.gov/MatrixMarket/mmio/c/example_read.c'
        'http://math.nist.gov/MatrixMarket/mmio/c/example_write.c')

build() {
	cd "$srcdir/"
        export C_INCLUDE_PATH="$PWD"
        gcc -fPIC -c mmio.c -o mmio.o
        gcc -shared -Wl,-soname,libmmio.so.1,--export-dynamic -o libmmio.so.1 mmio.o
}

package() {

	cd "$srcdir/"
        install -d "$pkgdir/$_includesdir"
        install -d "$pkgdir/$_libdir"
        install -d "$pkgdir/$_exampledir"

        install libmmio.so.1 "$pkgdir/$_libdir"
        ln -s "$pkgdir/$_libdir/libmmio.so.1" "$pkgdir/$_libdir/libmmio.so"
        install mmio.h "$pkgdir/$_includesdir"
        
        msg "Installing examples to $_exampledir"
        install example*.c "$pkgdir/$_exampledir"
}

md5sums=('40aa1ec217bf5cf98fe34465f9d64939'
         'b614df7f1a2f964d58635aa7ba4edadd'
         '89ed3a42c2bdd8d8bfbfe4bc419e2873'
         '22b7c5548a29880fa0b95ea98c2c52a4')
