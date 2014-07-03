# Maintainer: boenki <boenki at gmx dot de>

pkgname=ffdiaporama-rsc-devel
pkgver=2.2.devel.2014.0503
pkgrel=2
pkgdesc="Recource-files for ffDiaporama (development version)"
arch=('any')
url="http://ffdiaporama.tuxfamily.org"
license=('GPL2')
conflicts=('ffdiaporama-rsc')
source=(http://download.tuxfamily.org/ffdiaporama/Packages/Devel/ffdiaporama_rsc_$pkgver.tar.gz)
md5sums=('37bfd8ba62dac8dcbde679aee29a7aad')

build() {
  cd ffDiaporama_rsc
  qmake-qt5 ffDiaporama_rsc.pro
  make
}

package() {
  cd ffDiaporama_rsc
  make install INSTALL_ROOT=$pkgdir
}
