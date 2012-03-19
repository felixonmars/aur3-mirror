# Maintainer: Harley Laue <losinggeneration@gmail.com>
pkgname=libz80
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple and clean Z80 emulation library."
arch=(i686 x86_64 ppc)
url="http://libz80.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('patch')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        libz80-makefile.patch)
md5sums=('c25921ba8a7fce2c0540f9c4ea45eca5'
         'ea86fdc1cb1dcefa60f5b3d6d16c9173')

build() {
  cd "$srcdir/$pkgname"
  patch -p1 < $srcdir/libz80-makefile.patch

  make -j1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
