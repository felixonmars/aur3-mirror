# Maintainer: perlawk

pkgname=caml-light
_pkgname=Camllight-master
pkgver=0.8.2
pkgrel=1
pkgdesc="Caml Light is a small, portable implementation of the ML language. That runs on most Unix machines."
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
url="http://caml.inria.fr/"
depends=()
makedepends=('tk>=8.6' 'libx11')
source=(https://github.com/FBoisson/Camllight/archive/master.zip)
options=('!makeflags' '!emptydirs')
md5sums=(SKIP)

build() {
  cd "${srcdir}/${_pkgname}"/src

	sed -i 's!usr/local!usr!g;' Makefile
  sed -i 's!#include <strings.h>!!;' ../src/runtime/stacks.c
  sed -i 's!#include <strings.h>!!;' ../src/runtime/minor_gc.c
  sed -i 's!#include <strings.h>!!;' ../src/runtime/memory.c
  sed -i 's!#include <strings.h>!!;' ../contrib/libstr/regex-0.12/regex.c

	make configure
  make world
}

package() {
  cd "${srcdir}/${_pkgname}"/src
	make -e INSTROOT="$pkgdir" -e MANDIR="$pkgdir"/usr/share/man/man1/ install
}
