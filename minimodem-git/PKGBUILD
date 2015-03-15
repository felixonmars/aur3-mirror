# Maintainer: Lukas Epple <post@lukasepple.de>

_pkgname=minimodem
pkgname="$_pkgname-git"
pkgver=minimodem.0.21.1.r0.g1439efa
pkgrel=4
pkgdesc="general-purpose software audio FSK modem"
arch=('i686' 'x86_64')
url="http://www.whence.com/minimodem/"
license=('GPL3')
depends=('libpulse' 'fftw')
makedepends=('git' 'automake-1.14' 'make')
conflicts=('minimodem')
provides=('minimodem')
source=(git+https://github.com/kamalmostafa/minimodem.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make check
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
