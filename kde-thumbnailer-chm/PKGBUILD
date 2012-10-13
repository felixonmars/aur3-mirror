# Contributer: giacomogiorgianni@gmail.com 

pkgname=kde-thumbnailer-chm
pkgver=0.2
pkgrel=1
pkgdesc="A KDE thumbnail generator for the CHM file format. It uses CHMlib http://www.jedrea.com/chmlib/ to extract the covers"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KDE+CHM+Thumbnailer?content=153410"
license=('GPL')
depends=('kdelibs' 'chmlib')
makedepends=('cmake' 'automoc4')
install=thumbnailer-chm.install
source=("http://kde-apps.org/CONTENT/content-files/153410-$pkgname-$pkgver.tar.gz")
md5sums=('e8c88c574941cb1ba05c8b9e88f100e6')

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