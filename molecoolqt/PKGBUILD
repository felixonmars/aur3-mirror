# Maintainer: Jens Luebben jens.luebben@stud.uni-goettingen.de
# Author: Christian Huebschle http://www.molecoolqt.de/

pkgname=molecoolqt

pkgver=0.0.366

pkgrel=0

pkgdesc="A molecule viewer for charge density research based on the QT4 framework."

url="http://www.molecoolqt.de/"

arch=('x86_64' 'i686')

license=('LGPLv2')

depends=('qt4' 'fftw')

source=("${pkgname}-${pkgver}.tar.bz2")

md5sums=('f0e40e1049a99c500285cee6b42c2843')


 

build() {

  cd "${srcdir}/"

  tar xvjf molecoolqt-${pkgver}.tar.bz2
  cd molecoolqt-${pkgver}
  qmake-qt4
  make

}

 

package() {

  cd "${srcdir}/${pkgname}-${pkgver}/"

  make INSTALL_ROOT=$pkgdir install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}

 

