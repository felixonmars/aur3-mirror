# Original contributor: SiD/sidious <miste78@web.de>
# Current contributor: PsyToolkit <stoet@gmx.co.uk>
pkgname=libparapin
pkgver=1.5.1beta1
pkgver2=1.5.1-beta1
pkgrel=3
pkgdesc="a Parallel Port Pin Programming Library for Linux"
arch=('i686' 'x86_64')
url="http://parapin.sourceforge.net/"
license=('LGPL')
depends=('make' 'gcc' 'linux-headers')
makedepends=('binutils')
options=('staticlibs')

source=(http://downloads.sourceforge.net/parapin/parapin-$pkgver2.tgz \
	Makefile.diff \
)

md5sums=('20ce7b997c3f907de49cc7aaa1946e00' \
         'f24a1922eebae8efc60dc7d7aeaf0e9f' \
)

prepare() {
  cd "$srcdir/parapin-$pkgver2"
  patch -p0 < ../Makefile.diff
}

build() {
  cd "$srcdir/parapin-$pkgver2"
  make || return 1
}

package() {
  cd "$srcdir/parapin-$pkgver2"
  make PREFIX="/usr" DESTDIR="$pkgdir" install || return 1
}

