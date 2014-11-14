# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=qcustomplot
pkgver=1.2.1
pkgrel=1
pkgdesc="Plotting library for Qt 5.x"
arch=(i686 x86_64)
url="http://www.qcustomplot.com"
license=('GPL2')
depends=('qt5-base')
source=("http://www.qcustomplot.com/release/$pkgver/QCustomPlot.tar.gz"
        "qcustomplot.pro")
sha256sums=('4f416be8182941d0e37f4fccf5d103bae088f4dd44938bfd52a01811b6fcdabf'
            '235e81c5a7e0d7b7258be0713bc50133ddc4cffa45b5949d320e60dbbcacf2d6')

prepare() {
  cp "${srcdir}/qcustomplot.pro" "${srcdir}/${pkgname}/qcustomplot.pro"
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt5 PREFIX=/usr qcustomplot.pro
  make -j$(nproc)
}
 
package() {
 cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install
}
