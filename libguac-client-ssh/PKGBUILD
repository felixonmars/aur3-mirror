pkgname=libguac-client-ssh
pkgver=0.8.0
pkgrel=1
pkgdesc="SSH client for the Guacamole web application"
arch=('i686' 'x86_64')
url="http://guacamole.sourceforge.net"
license=('GPL3')
depends=(  )
makedepends=()
optdepends=()
provides=()
source=(http://sourceforge.net/projects/guacamole/files/current/source/$pkgname-$pkgver.tar.gz)
sha1sums=('e1b2a0e1b3a5bfb7323e3defe69065ebab18e092')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
