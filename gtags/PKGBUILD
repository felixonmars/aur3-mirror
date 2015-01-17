# Maintainer: Naquad <naquad@gmail.com>
pkgname=gtags
pkgver=6.3.3
pkgrel=3
pkgdesc="GNU GLOBAL source code tagging system"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/global/global.html"
license=('GPL')
makedepends=(gperf bison flex)
depends=(perl bash libtool)
source=(http://tamacom.com/global/global-6.3.3.tar.gz
        gozilla.patch)
md5sums=('bef48c9e6bd7aa78eef984932df1bc6c'
         '2513121820c6760ddd550e17aa4de06e')
prepare() {
  cd $srcdir/global-$pkgver
  patch -p1 -Ni $srcdir/gozilla.patch
  sh reconf.sh
}

build() {
  cd $srcdir/global-$pkgver
  ./configure --prefix=/usr --localstatedir=/var/state
  make
}

package() {
  cd $srcdir/global-$pkgver
  make DESTDIR=$pkgdir/ install
}
