# Maintainer: uberushaximus <uberushaximus AT gmail DOT com>

pkgname=recaged-git
pkgver=12.f935cda
pkgrel=1
pkgdesc="A Free Software, Futuristic, Racing Simulator"
arch=('any')
url="http://recaged.net"
license=('GPLv3')
depends=('glew' 'ode' 'sdl')
makedepends=('git')
source=("$pkgname"::'git://git.sv.gnu.org/recaged.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
