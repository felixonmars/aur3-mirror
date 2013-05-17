pkgname=smaragd
pkgver=0.0.7
pkgrel=1
pkgdesc="Smaragd is a window decoration engine for KWin."
arch=('i686' 'x86_64')
url=('http://kde-look.org/content/show.php/Smaragd+(Emerald+for+KDE)?content=125162')
license=('GPL2')
depends=('kdebase-workspace' 'qt4')
makedepends=('cmake' 'automoc4')
source=('http://kde-look.org/CONTENT/content-files/125162-smaragd-0.0.7.tar.gz')
md5sums=('2288a0a333b43d635eb476c256b1b01d')
conflicts=('smaragd-git')
install=smaragd.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  rm -rf build && mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .. || return 1
  make || return 1
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install || return 1
}