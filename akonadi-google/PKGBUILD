# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=akonadi-google
pkgver=0.3
pkgrel=1
pkgdesc="An Akonadi Resource for accessing Google services"
arch=('i686' 'x86_64')
url="http://projects.kde.org/akonadi-google"
license=('GPL')
depends=('kdebase-runtime' 'kdepimlibs' 'qjson')
makedepends=('cmake' 'automoc4' 'boost')
conflicts=('akonadi-google-git')
source=("http://www.progdan.cz/wp-content/uploads/${pkgname}-${pkgver}.tar.gz")
md5sums=('8c5c1e015068bea90bf25dd7858dc913')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}