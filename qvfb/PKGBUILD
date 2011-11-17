# Maintainer: Bernhard Walle <bernhard@bwalle.de>

pkgname=qvfb
pkgdesc='Qt virtual framebuffer (Embedded Linux development tool)'
pkgver=4.7.4
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL')
depends=('qt')
builddepends=('qt-private-headers')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://get.qt.nokia.com/qt/source/${_pkgfqn}.tar.gz")
md5sums=('9831cf1dfa8d0689a06c2c54c5c65aaf')

build() {
  cd "${srcdir}"/${_pkgfqn}/tools/qvfb
  qmake
  make
}

package() {
  cd "${srcdir}"/${_pkgfqn}/tools/qvfb
  make INSTALL_ROOT="${pkgdir}" install
}
