# Maintainer: Ken Tossell <ken@tossell.net>
pkgname=libuvc-git
pkgver=0.0.3.r0.g2555790
pkgrel=1
pkgdesc="a cross-platform library for USB video devices"
arch=('i686' 'x86_64')
url="https://int80k.com/libuvc/"
license=('BSD')
depends=('libusbx')
makedepends=('cmake')
source=(git+ssh://git@github.com/ktossell/libuvc.git)
md5sums=('SKIP')
conflicts=('libuvc')
provides=('libuvc')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/v([^-]*)-([^-]*-g)/\1-r\2/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname}-build"
    cd "${srcdir}/${pkgname}-build"

    cmake "${srcdir}/${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-build"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

