# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=openshack
pkgver=0.1.0
pkgrel=1
pkgdesc="amateur radio logbook"
arch=("x86_64" "i686")
url="http://dl2ic.de"
license=("GPL3")
depends=(qt5-base hamlib)
mkdepends=(qt5-tools)
source=("https://github.com/7h0ma5/OpenShack/archive/v${pkgver}.zip")
md5sums=('25b5089b6fd82c199b70ec72df3e2d25')

build() {
  cd "${srcdir}/OpenShack-${pkgver}"

  qmake PREFIX=${pkgdir}/usr OpenShack.pro
  make || return 1
}

package() {
  cd "${srcdir}/OpenShack-${pkgver}"
  make install || return 1
}
