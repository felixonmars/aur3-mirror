# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>
pkgname=fortuner
pkgver=0.4.0
pkgrel=1
pkgdesc="A graphical modernization of classic UNIX fortune program."
arch=('i686' 'x86_64')
url="https://github.com/jnumm/fortuner"
license=('GPL3')
depends=('gtk3' 'libnotify' 'fortune-mod' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('cmake')
install=fortuner.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jnumm/${pkgname}/tarball/${pkgver})
md5sums=('12d494f8f78c5a8ee97ccb79296e852d')

build() {
  mv ${srcdir}/jnumm-${pkgname}-* "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
