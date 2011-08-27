# Contributor: Changaco <me@changaco.net>
pkgname=lliaphon
pkgver=0.4
pkgrel=2
pkgdesc="A TTS program which uses mbrola."
arch=(i686 x86_64)
url="https://gna.org/projects/lliaphon"
license=(GPL)
depends=(mbrola)
source=(http://download.gna.org/lliaphon/stable/$pkgname-$pkgver.tar.gz)
md5sums=('852097edc1501560ae74c57f3c67ecd0')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
