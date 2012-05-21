
pkgname=kminidlna-client
pkgver=1.0
pkgrel=1
pkgdesc="client desktop MiniDLNA http://minidlna.sourceforge.net/with REST remote control"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/kminidlna/"
license=('GPL')
depends=('')
makedepends=('cmake' 'gettext' 'openssl' 'automoc4')
options=('!libtool')
source=(https://sourceforge.net/projects/kminidlna/files/Desktop%20client/${pkgname}.tar.gz)
sha1sums=('807995e5f78727a801f061eae657bae8ee9b5cbe')

build() {
  cd "${srcdir}"
  mkdir build
  cd build

  cmake "../${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
