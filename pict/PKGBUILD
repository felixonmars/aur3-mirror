# Maintainer: perlawk
pkgname=pict
pkgver=4.1
pkgrel=2
pkgdesc='Pict, a concurrent programming language based on the pi-calculus.'
url="http://www.cis.upenn.edu/~bcpierce/papers/pict/Html/Pict.html"
license=('GPL')
arch=('i686' 'x86_64')
depends=(ocaml)
options=(!strip)

source=(http://www.cis.upenn.edu/~bcpierce/papers/pict/pict-4.1/pict-4.1.tar.gz)
build() {
    cd "$srcdir"/pict-4.1
		sed -i 's!^INSTALL!# INSTALL!;' SiteSpecific
		sed -i 's!^# INSTALLDIR = /usr/local/bin/!INSTALLDIR = /usr//bin!;' SiteSpecific
		sed -i 's!^# INSTALLLIB = /usr/local/lib/pict/!INSTALLLIB = /usr//lib/pict!;' SiteSpecific
    make 
}

package() {
    cd "$srcdir"/pict-4.1

		mkdir -p "$pkgdir/usr/bin"
		mkdir -p "$pkgdir/usr/lib/pict"
		cp Tools/{src2tex,src2pi} "$pkgdir/usr/lib/pict"
		echo '#!/bin/sh'                 >"$pkgdir"/usr/bin/pict
		echo VERSION=4.1          >>"$pkgdir"/usr/bin/pict
		echo export VERSION              >>"$pkgdir"/usr/bin/pict
		echo PICTLIB=/usr/lib/pict       >>"$pkgdir"/usr/bin/pict
		echo export PICTLIB              >>"$pkgdir"/usr/bin/pict
		echo PICTRTS=/usr/lib/pict       >>"$pkgdir"/usr/bin/pict
		echo export PICTRTS              >>"$pkgdir"/usr/bin/pict
		echo X11INCLUDE=/usr/include    >>"$pkgdir"/usr/bin/pict
		echo export X11INCLUDE           >>"$pkgdir"/usr/bin/pict
		echo "X11EXTRA=\"\""  >>"$pkgdir"/usr/bin/pict
		echo export X11EXTRA             >>"$pkgdir"/usr/bin/pict
		echo X11LIB=/usr/lib            >>"$pkgdir"/usr/bin/pict
		echo export X11LIB               >>"$pkgdir"/usr/bin/pict
		echo GCC=gcc                  >>"$pkgdir"/usr/bin/pict
		echo export GCC                  >>"$pkgdir"/usr/bin/pict
		echo exec /usr/lib/pict/pict '$*' >>"$pkgdir"/usr/bin/pict
		chmod 755 "$pkgdir"/usr/bin/pict

		cp -f Pict/pict "$pkgdir"/usr/lib/pict
		chmod 755 "$pkgdir"/usr/lib/pict/pict

		cp -f Runtime/*.a Runtime/pict.h "$pkgdir"/usr/lib/pict

		mkdir -p "$pkgdir"/usr/lib/pict/Contrib "$pkgdir"/usr/lib/pict/Posix
		mkdir -p "$pkgdir"/usr/lib/pict/Picture "$pkgdir"/usr/lib/pict/Std
		mkdir -p "$pkgdir"/usr/lib/pict/X11

		cd Lib
		cp *.px *.px.o "$pkgdir"/usr/lib/pict
		cp Contrib/*.px Contrib/*.px.o "$pkgdir"/usr/lib/pict/Contrib
		cp Posix/*.px Posix/*.px.o "$pkgdir"/usr/lib/pict/Posix
		cp Picture/*.px Picture/*.px.o "$pkgdir"/usr/lib/pict/Picture
		cp Std/*.px Std/*.px.o "$pkgdir"/usr/lib/pict/Std
		cp X11/*.px X11/*.px.o "$pkgdir"/usr/lib/pict/X11
	}

md5sums=('b879a502af58479751bdaefb8e4c40b5')
