# Maintainer: Julian Leyh <julian@vgai.de>

pkgname=texttools
pkgver=2.1.0
pkgrel=1
pkgdesc="ncurses-based library for the Linux console"
arch=('i686' 'x86_64')
url="http://www.pegasoft.ca/tt.html"
license=('GPL')
depends=(gcc-ada)
source=(http://www.pegasoft.ca/downloads/$pkgname-$pkgver.tgz
        makefile.patch)
md5sums=('aa349865ae24994200578d57a3c0b359'
         'f231c2266a3f17195e57a8bff342204a')

build() {
  cd "$srcdir/$pkgname"

  patch -Np0 -i ../makefile.patch

  make build
}

package() {
  mkdir -p "$pkgdir/usr/lib/gnat"
  cd "$srcdir/$pkgname"
  make SRC_DIR=usr/include GPR_DIR=usr/lib/gnat ALI_DIR=usr/lib DESTDIR="$pkgdir/" install 
}

# vim:set ts=2 sw=2 et:
