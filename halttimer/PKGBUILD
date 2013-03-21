# Maintainer: Fabian Hirschmann <fabian@hirschm.net>
pkgname=halttimer
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple single button lirc-aware shut down timer with an OSD"
arch=('i686' 'x86_64')
url="http://github.com/fhirschmann/halttimer/"
license=('GPL3')
makedepends=('make')
depends=('xosd')
optdepends=('lirc-utils: infrared remote control support')
source=(http://dl.0x0b.de/halttimer/$pkgname-$pkgver.tar.gz
        http://dl.0x0b.de/halttimer/$pkgname-$pkgver.tar.gz.asc)
md5sums=('b0d747a20b42b0eee07ab6551ab4e8ad' 'ee1e54559c5e87cd1a37c947632e732e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
