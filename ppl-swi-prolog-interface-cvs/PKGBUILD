pkgname=ppl-swi-prolog-interface-cvs
pkgver=20081026
pkgrel=1
pkgdesc="The PPL swi prolog interface."
arch=('i686' 'x86_64')
url="http://www.cs.unipr.it/ppl"
license=('GPL3')
depends=('swi-prolog>=5.6.0' 'parma-polyhedra-library')
makedepends=('cvs' 'doxygen' 'automake' 'autoconf' 'libtool' 'graphviz' 'tetex')
provides=()
conflicts=()

replaces=()
backup=()
install=
source=()
md5sums=()

build() {
  cd "$startdir"

  msg 'Downloading the sources:'
  cvs -z9 -d :pserver:anoncvs@cvs.cs.unipr.it:/cvs/ppl checkout \
    -f -D "$pkgver" -P ppl || return 1

  cp -fa ppl "$srcdir"
  cd "$srcdir"/ppl

  msg 'Creating the configure file:'
  autoreconf -f || return 1

  msg 'Configuring:'
  ./configure --prefix=/usr --enable-optimization \
    --enable-interfaces="swi-prolog" \
    --disable-dependency-tracking --enable-arch="$arch" || return 1

  msg 'Making:'
  make || return 1

  msg 'Installing:'
  mkdir -p "$srcdir"/tmp
  make DESTDIR="$srcdir"/tmp install || return 1

  cd "$pkgdir"
  install -m755 -d usr/bin usr/lib/ppl

  cd "$srcdir"/tmp
  install -m755 usr/bin/ppl_pl "$pkgdir"/usr/bin
  install -m644 usr/lib/ppl/libppl_swiprolog.a "$pkgdir"/usr/lib/ppl
  install -m755 usr/lib/ppl/libppl_swiprolog.la "$pkgdir"/usr/lib/ppl
  install -m755 usr/lib/ppl/libppl_swiprolog.so "$pkgdir"/usr/lib/ppl
  install -m644 usr/lib/ppl/ppl_swiprolog.pl "$pkgdir"/usr/lib/ppl

  return 0
}

