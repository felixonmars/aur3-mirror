# Maintainer:  Jesse Jaara	 <jesse.jaara@gmail.com>

pkgname=projectm-qt
pkgver=2.1.0
pkgrel=1
pkgdesc="A Qt Backend/libraries for a ProjectM GUI."
url="http://projectm.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('projectm' 'qt')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/projectm/projectM-qt-${pkgver}-Source.tar.gz)

build() {
  cd "${srcdir}/projectM-qt-${pkgver}-Source"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/projectM-qt-${pkgver}-Source"

  make DESTDIR="${pkgdir}" install
}

md5sums=('69b86d608beaa98c930e159e198a1844')
