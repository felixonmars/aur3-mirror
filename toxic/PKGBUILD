# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Florian Hahn <flo@fhahn.com>

pkgname=toxic
pkgver=0.5.2
pkgrel=1

pkgdesc='Ncurses Tox client'
arch=('i686' 'x86_64')
url='http://tox.im'
license=('GPL3')

depends=('tox-git' 'freealut' 'libnotify')

source=("https://github.com/Tox/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('6a45cd93d3a64b0b580361a959616140')
sha256sums=('f2ebf550fbd9b9ee5062740239cdcd9549465caa8080f0e88e797590231db0cc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

