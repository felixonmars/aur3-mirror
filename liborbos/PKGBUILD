# Maintainer: Zatherz <zatherz[at]linux[dot]com>
pkgname=liborbos
pkgver=r0.ge26f7ef
pkgrel=1
pkgdesc="Set of libraries containing routines for the Orb OS."
url="http://orbos.github.io/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
makedepends=('git' 'make')
source=("git://github.com/Zatherz/liborbos")
md5sums=("SKIP")

pkgver() {
  cd "liborbos"
  git describe --long --all | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/heads\/master.//g'
}

build() {
  cd "$srcdir/liborbos/liborbos-math"
  make
}

package() {
  cd "$srcdir/liborbos/liborbos-math"
  make DESTDIR="$pkgdir" install
}
