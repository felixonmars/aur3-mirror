pkgname=ppl-cvs
pkgver=20081111
pkgrel=1
pkgdesc="A modern C++ library providing numerical abstractions. CVS version."
arch=('i686' 'x86_64')
url="http://www.cs.unipr.it/ppl"
license=('GPL3')
depends=('gmp>=4.1.3')
makedepends=('cvs' 'doxygen' 'automake' 'autoconf' 'libtool' 'graphviz' 'tetex')
provides=('ppl')
conflicts=('ppl')

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
  ./configure --prefix=/usr --enable-interfaces="c,cxx" \
    --enable-arch="$arch" || return 1

  msg 'Making:'
  make || return 1

  #msg 'Checking:'
  #make check || return 1

  msg 'Installing:'
  make DESTDIR="$pkgdir" install || return 1

  return 0
}

