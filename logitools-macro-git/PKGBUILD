_pkgname=logitools-macro
pkgname=${_pkgname}-git
pkgver=1.0
pkgrel=1
url="http://michael-manley.github.com/logitools"
pkgdesc="A simple Macro recording/playback app for LogiTools Daemon."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('logitoolsd')
makedepends=('cmake')
provides=('logitools-macro')
conflicts=('logitools-macro')
source=("git://github.com/LogiTools/${_pkgname}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir obj-src
  cd obj-src

  cmake .. -DCMAKE_MODULE_PATH=/usr/share/cmake/Modules -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/obj-src"

  make DESTDIR="${pkgdir}" install
}
