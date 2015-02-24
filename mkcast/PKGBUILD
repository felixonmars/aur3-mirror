# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=mkcast
pkgver=latest
pkgrel=1
pkgdesc="Create GIF screencasts of a terminal, with key presses overlaid."
arch=(any)
url="https://github.com/KeyboardFire/mkcast"
license=('MIT')
depends=()
makedepends=("git")
source=("git+https://github.com/KeyboardFire/mkcast.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
