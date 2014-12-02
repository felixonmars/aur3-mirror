# Maintainer: Anatoly V. Beregovoy <avberegovoy@gmail.com>

pkgname=dfcgen-gtk
pkgver=0.4
pkgrel=2
pkgdesc="A free tool for the design of time-discrete (digital) filters/systems."
arch=('i686' 'x86_64')
url="http://http://www.dfcgen.de/"
license=('GPL')
groups=('base-devel')
depends=('glibc' 'gtk2')
source=(http://www.dfcgen.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('577263b1589c260ed27bd0bb297a114c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
}
