_pkgname=logitoolsd
pkgname=${_pkgname}-git
pkgver=1.0
pkgrel=1
url="http://michael-manley.github.com/logitools"
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('liblogitech' 'liblogitechrender')
makedepends=('cmake')
provides=('g15daemon' 'g15daemon-svn' 'logitoolsd')
conflicts=('g15daemon' 'g15daemon-svn' 'logitoolsd')
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
