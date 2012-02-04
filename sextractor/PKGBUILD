# Maintainer: <clu>
# Contributor: Arthur Danskin <arthurdanskin@gmail.com>

pkgname=sextractor
pkgver=2.5.0
pkgrel=2
pkgdesc="builds a catalogue of objects from an astronomical image"
url="http://www.astromatic.net/software/sextractor"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.astromatic.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('3dede44685b582ad5ee03f5b69423530')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
