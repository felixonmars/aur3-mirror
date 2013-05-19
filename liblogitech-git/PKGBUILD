_pkgname=liblogitech
pkgname=${_pkgname}-git
pkgver=1.0
pkgrel=1
url="http://michael-manley.github.com/logitools"
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libusb')
makedepends=('cmake')
provides=('libg15' 'liblogitech')
conflicts=('libg15' 'libg15-svn' 'liblogitech')
source=("git://github.com/LogiTools/${_pkgname}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir obj-src
  cd obj-src

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/obj-src"

  make DESTDIR="${pkgdir}" install
}
