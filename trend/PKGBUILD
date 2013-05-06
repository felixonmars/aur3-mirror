# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Cristóvão Sousa <crisjss@gmail.com>

pkgname=trend
pkgver=1.2
epoch=1
pkgrel=1
pkgdesc="a general-purpose, efficient trend graph for live data"
arch=('i686' 'x86_64')
url="http://www.thregr.org/~wavexx/software/trend/"
license=('LGPL')
depends=('freeglut' 'glu' 'mesa')
source=(http://www.thregr.org/~wavexx/software/trend/releases/trend-$pkgver.tar.gz)
md5sums=('dc78976ef0b62b93d433208ef7ef80c0')
sha256sums=('40b0f58101801c9373d2b1d990eb327a4582e9a96e4eb2b43faf87346f9dd64f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -C src
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 src/trend "$pkgdir/usr/bin/trend"
  install -D -m755 trend.1 "$pkgdir/usr/share/man/man1/trend.1"
}
