# Maintainer: ant32 <antreimer@gmail.com>

pkgname=qcustomplot-qt4
pkgver=1.3.0
pkgrel=1
pkgdesc="Plotting library for Qt4"
url="http://www.qcustomplot.com"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt4')
conflicts=('qcustomplot-qt5')
source=("http://www.qcustomplot.com/release/${pkgver}/QCustomPlot-sharedlib.tar.gz"
        "http://www.qcustomplot.com/release/${pkgver}/QCustomPlot-source.tar.gz")
md5sums=('9ca96779d45b77a2f38ce2a45da33037'
         'ab85ee199f3b25c874772552f11f99e0')

build() {
  cd "${srcdir}"

  # fix path to source files
  sed -i 's|../../qcustomplot|../../qcustomplot-source/qcustomplot|g' \
    "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"

  qmake-qt4 "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"
  make release
}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/"{lib,include}
  cp -a libqcustomplot.so* "$pkgdir/usr/lib"
  cp -a qcustomplot-source/qcustomplot.h "${pkgdir}/usr/include"
}
