# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-iemmatrix
_pkg=iemmatrix
pkgver=0.2
pkgrel=1
pkgdesc="Pure Data: a matrix processing library from IEM"
arch=('any')
url="http://www.puredata.info"
license=('GPL2')
depends=('pd')
source=("http://downloads.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('1e2655cf4b98c6fee20a55dc15e32d6f')

build() {
  cd "$srcdir/$_pkg-$pkgver/src"
  
  aclocal &&
  autoconf &&
  ./configure &&
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver/src"

  make DESTDIR="$pkgdir/" install
}
