# Maintainer: Franck Barbenoire <fbarbenoire at yahoo dot fr>
pkgname=frankenstein
pkgver=1.0
pkgrel=1
pkgdesc="A reconfigurable assembler package, especially suited for 8-bit processors, consisting of a base assembler module and a yacc parser, for each microprocessor, to handle mnemonics and addressing."
arch=("i686", "x86_64")
url="http://labs.fizzy.biz/~ftp/pub/uP/8-bit-chips/"
license=('GPL')
depends=(glibc)
source=(http://labs.fizzy.biz/~ftp/pub/uP/8-bit-chips/Frankenstein.tar.gz)
noextract=()
md5sums=(f923a313ae098f80cc82e6067fa7b816)

prepare() {
	cd "$srcdir/frankenstein.asm-src"
pwd
	patch -p1 -i "$srcdir/../Frankenstein.patch"
}

build() {
	cd "$srcdir/frankenstein.asm-src"
	for y in *.y; do
	    fn=${y%%.*}
	    make $fn TARGET=$fn
	done
}

package() {
	cd "$srcdir/frankenstein.asm-src"

        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/man/man1"
        mkdir -p "$pkgdir/usr/share/doc/$pkgname"

	for y in *.y; do
	   fn=${y%%.*}
	   cp $fn "$pkgdir/usr/bin"
	   cp $fn.1 "$pkgdir/usr/share/man/man1"
	   cp $fn.doc "$pkgdir/usr/share/doc/$pkgname"
	done

	chmod 644 $pkgdir/usr/share/man/man1/*
	chmod 644 $pkgdir/usr/share/doc/$pkgname/*
}
