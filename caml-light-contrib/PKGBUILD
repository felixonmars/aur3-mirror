# Maintainer: perlawk

pkgbase='caml-light-contrib'
pkgname=caml-light-contrib
_pkgname=Camllight-master
pkgver=0.8.2
pkgrel=1
pkgdesc="Caml Light is a small, portable implementation of the ML language. That runs on most Unix machines. It's the contrib package'"
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
url="http://caml.inria.fr/"
depends=('caml-light')
makedepends=('tk>=8.6' 'libx11' 'caml-light')
source=(https://github.com/FBoisson/Camllight/archive/master.zip)
options=('!makeflags' '!emptydirs')

build() {
  cd "${srcdir}/${_pkgname}"/src

  sed -i 's!usr/local!usr!g;' Makefile
	sed -i 's!#include <strings.h>!!;' ../src/runtime/stacks.c
	sed -i 's!#include <strings.h>!!;' ../src/runtime/minor_gc.c
	sed -i 's!#include <strings.h>!!;' ../src/runtime/memory.c
	sed -i 's!#include <strings.h>!!;' ../contrib/libstr/regex-0.12/regex.c

	make configure
  make world

	cd ../contrib
	sed -i 's/tk8.5/tk8.6/g; s/tcl8.5/tcl8.6/g; s!usr/local!usr!g;' Makefile
	sed -i 's/cltclinterp->result/Tcl_GetStringResult(cltclinterp)/g;' camltk/libsupport/camltk.c
	sed -i 's/cltclinterp->result/Tcl_GetStringResult(cltclinterp)/g;' camltk4/libsupport/camltk.c
	make all
}

package() {
  cd "${srcdir}/${_pkgname}"/src
	mkdir -p "$pkgdir"/usr/lib/caml-light/ 

	cd ../contrib
	make -e LIBDIR="$pkgdir"/usr/lib/caml-light/ \
-e INSTROOT="$pkgdir" \
-e BINDIR="$pkgdir"/usr/bin/ \
-e MANDIR="$pkgdir"/usr/share/man/man1/ install
}
md5sums=('b89f76f33887e72c5e20ea53b024646a')
