# Contributor: Philanecros Heliostein <philanecros@gmail.com>

pkgname="qtunet"
pkgver="0.1.55"
pkgrel=1
pkgdesc="A fork from mytunet project's qtunet-qt4"

arch=("i686" "x86_64")

url="http://code.google.com/p/qtunet/"
license=('GPLv3')

#groups=()

depends=("qt")
makedepends=("qt")
#optdepends=()

#provides=()
#conflicts=()
#replaces=()

#backup=()
#options=()

#install=
#changelog=

source=("http://qtunet.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
#noextract=()
md5sums=("5b188e6d422cbadd9c9e8662e5b4f989")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  qmake

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}/usr" install
}
