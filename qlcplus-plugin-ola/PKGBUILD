# Maintainer: Jerome Lebleu <jerome dot lebleu at mailoo dot org>

pkgname=qlcplus-plugin-ola
pkgver=4.8.2
pkgrel=1
pkgdesc="Open Lighting Architecture plugin for QLC+"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qlcplus"
license=('APACHE')
depends=('qlcplus' 'ola')
conflicts=('qlcplus-qt5')
source=("http://downloads.sourceforge.net/project/qlcplus/${pkgver}/qlcplus_${pkgver}.tar.gz")
md5sums=('d06678470f64e362d3749515711f4acd')

build() {
  cd "${srcdir}/qlcplus-${pkgver}/plugins/ola"

  qmake-qt4 
  make
}

package() {
  cd "${srcdir}/qlcplus-${pkgver}/plugins/ola"
  make INSTALL_ROOT="${pkgdir}/" install
}
