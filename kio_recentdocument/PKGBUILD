# Maintainer: FoolEcho <foolecho@gmail.com>
pkgname=kio_recentdocument  
pkgver=0.2.1
pkgrel=1
pkgdesc="A kio together with kcm to control and display recent document in recentdocument:/"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/kio+recent+document?content=145878"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
install=kio_recentdocument.install
source=("http://kde-apps.org/CONTENT/content-files/145878-$pkgname-$pkgver.tar.bz2")
md5sums=('063ee31788f5845e3d7bd18fa1338097')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make ||return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=$pkgdir install || return 1
}