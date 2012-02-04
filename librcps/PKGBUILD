# Maintainer: Michal Minar <i@minami.cz>
pkgname=librcps
pkgver=0.3
pkgrel=2
pkgdesc="Versatile, powerful and fast library for resource constrained project scheduling"
arch=('i686' 'x86_64')
url="http://www.librcps.org/index.html"
license=('GPL')
depends=('glibc')
options=(!libtool)
source=("http://www.librcps.org/${pkgname}-${pkgver}.tar.gz")
md5sums=('a5e93e18ab5590f0e209a077446646da')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

