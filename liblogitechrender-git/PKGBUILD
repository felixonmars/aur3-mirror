_pkgname=liblogitechrender
pkgname=${_pkgname}-git
pkgver=1.0
pkgrel=1
url="http://michael-manley.github.com/logitools"
pkgdesc="A small graphics library optimised for drawing on an LCD."
arch=('i686' 'x86_64')
license=('GPL2')
depends=()
makedepends=('cmake')
provides=('libg15render' 'liblogitechrender')
conflicts=('libg15render' 'libg15render-svn' 'liblogitechrender')
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
