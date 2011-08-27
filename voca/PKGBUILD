# Maintainer: Traumness <juanantoniocanovasperez@gmail.com>

pkgname=voca
pkgver=4.3.1
pkgrel=1
pkgdesc="Free vocabulary trainer, use your own worldlist or download one from its official website. NEEDS MONO."
arch=('i686' 'x86_64')
url="http://www.oriente-voca.eu/index.php?lang=eng"
license=('GPL')
depends=('xdg-utils' 'mono')
source=(http://www.oriente-voca.eu/$pkgname-$pkgver.tar.gz)
md5sums=('1da575ee1758cc5f97e814e6e00bfe7d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
  make -i DESTDIR=$pkgdir install
}