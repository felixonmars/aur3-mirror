# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=adflib-git
pkgver=20130324
pkgrel=1
pkgdesc="A free, portable and open implementation of the Amiga filesystem, library & tools"
arch=('i686' 'x86_64')
url="http://lclevy.free.fr/adflib/adflib.html"
license=('GPL')
makedepends=('git' 'libtool' 'automake' 'autoconf')

build() {
  cd "$srcdir"
  test -d ADFlib || git clone https://github.com/tonigi/ADFlib.git
  cd ADFlib

  sh autogen.sh
  ./configure --program-prefix=adf- --includedir=/usr/include/adflib --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
}

