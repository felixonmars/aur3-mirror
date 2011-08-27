# Contributor: SiD/sidious <miste78@web.de>
pkgname=libparapin-py
pkgver=1.5.0
pkgrel=1
pkgdesc="Python bindings for the parpin library"
arch=('i686')
url="http://parapin.sourceforge.net/"
license=('LGPL')
depends=('libparapin' 'python')
makedepends=('binutils')
source=(http://downloads.sourceforge.net/parapin/parapin-$pkgver.tgz \
	Makefile-2.6.diff \
        Makefile.py.diff \
)
md5sums=('f169505fc1887b9b7354e2f1ccc1612f' \
         'b125a0da13c03340268712e7d2ddbc27' \
         'a93c983f7f7ea05026268fe41c72361b' \
)

build() {
  cd "$startdir/src/parapin-$pkgver"

  patch -p0 < ../Makefile-2.6.diff
  patch -p0 < ../Makefile.py.diff
  ./setup-2.6.sh
  make parapin_py-build || return 1
  make PREFIX="/usr" DESTDIR="$startdir/pkg" parapin_py-install 
}


