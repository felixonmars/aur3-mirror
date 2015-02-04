# Contributer: giacomogiorgianni@gmail.com 


pkgname=pdfviewer
pkgver=29.b2334e
pkgrel=1
pkgdesc="Lightweight Qt-only PDF viewer"
arch=('any')
url="https://github.com/amkhlv/pdfviewer"
license=('GPL-2')
depends=('qt4' 'poppler-qt' 'zlib')
makedepends=('git' 'cmake' 'gettext' 'automoc4')
source=("git+https://github.com/amkhlv/${pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"
   #mkdir build
  #cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
 
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
