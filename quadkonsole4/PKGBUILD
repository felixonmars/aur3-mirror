# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=quadkonsole4
pkgver=0.4.4
pkgdesc="QuadKonsole embeds Konsole kparts in a grid layout"
pkgrel=2
arch=('i686' 'x86_64')
_kdeapps=141069
url="http://kde-apps.org/content/show.php?content=${_kdeapps}"
license=(GPL)
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
options=()
source=(http://kb.ccchl.de/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('542f406edcbd740672dd8d836b74edbe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d build ] && rm -rf build
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
           -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
} 
