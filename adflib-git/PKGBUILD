# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=adflib-git
pkgver=0.7.12.r10.gebde43a
pkgrel=2
pkgdesc="A free, portable and open implementation of the Amiga filesystem, library & tools"
arch=('i686' 'x86_64')
url="http://lclevy.free.fr/adflib/adflib.html"
license=('GPL')
makedepends=('git' 'libtool' 'automake' 'autoconf')
source=('adflib::git+https://github.com/tonigi/ADFlib.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/adflib"
  sh autogen.sh
  ./configure --program-prefix=adf- --includedir=/usr/include/adflib --prefix=/usr || return 1
  make || return 1
}

pkgver() {
  cd "$srcdir/adflib"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
  cd "$srcdir/adflib"
  make DESTDIR="$pkgdir/" install
}

