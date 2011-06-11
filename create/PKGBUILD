# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=create
pkgver=0.1.3
pkgrel=1
pkgdesc="Create Resources (brushes, palettes, etc.)"
arch=('any')
url="http://create.freedesktop.org/"
license=('GPL')
makedepends=('scons')
source=("http://create.freedesktop.org/releases/create/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d4d742bf65ad38423edacb96ef9fcf1c')

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr
  scons -Q install PREFIX="${pkgdir}"/usr
}
