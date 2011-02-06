# Contributor: Asa Marco <marcoasa90 [at] gmail [dot] com>

pkgname=unnks
pkgver=0.2.5
pkgrel=1
pkgdesc="native kontakt samples (nks/nkx) archives extractor"
arch=('i686' 'x86_64')
url="http://unavowed.vexillium.org/pub/projects/unnks/"
license=('GPL')
depends=()
makedepends=()
provides=('unnks')
conflicts=()
source=(http://opensoundsystem.altervista.org/$pkgname-$pkgver.tar.bz2)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
 }
md5sums=('f0717077423ee34c549cd6a3c2fd4e74')
