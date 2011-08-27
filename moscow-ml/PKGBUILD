# Maintainer: Maurício CA <mauricio.antunes@gmail.com>
pkgname=moscow-ml
pkgver=2.01
pkgrel=2
pkgdesc="light-weight implementation of Standard ML"
arch=(i686 x86_64)
url="http://www.itu.dk/~sestoft/mosml.html"
license=('GPL')
groups=()
depends=()
makedepends=(perl gcc make autoconf sed)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://www.itu.dk/people/sestoft/mosml/mos201src.tar.gz'
        'http://www.itu.dk/people/sestoft/mosml/gc_ctrl.c')
noextract=()
md5sums=('74aaaf988201fe92a9dbfbcb1e646f70'
         'ebb714a2d45889f4ecc796a9add40bd6')

build() {
  [ $CARCH=x86_64 ] && cp "$srcdir/gc_ctrl.c" "$srcdir/mosml/src/runtime/gc_ctrl.c"
  cd "$srcdir/mosml/src"
  sed -r \
      -e "s|^(MOSMLHOME=).*|\1$pkgdir/usr|" \
      -e "s|^LIBDIR=.*|&/$pkgname|" \
      -e "s|^INCDIR=.*|&/mosml|" \
      -e "s|^(DOCDIR=.*)/.*|\1/share/doc/$pkgname|" \
      -e "s|^(TOOLDIR=.*)/.*|\1/lib/$pkgname|" \
      -i "$srcdir/mosml/src/Makefile.inc"
  sed -r \
      -e "s|^.*config.*include.*config|#&|" \
      -i "$srcdir/mosml/src/Makefile"
  make world
  make install
  echo '#!/usr/bin/camlrunm' > "$pkgdir/usr/lib/$pkgname/header"
  for i in mosml mosmlc mosmllex; do \
      sed -r \
          -e "s|^(stdlib=).*|\1/usr/lib/$pkgname|" \
          -e "s|^(mosmlbin=).*|\1/usr/bin|" \
          -i "$pkgdir/usr/bin/$i"; \
  done
}

# vim:set ts=2 sw=2 et:
