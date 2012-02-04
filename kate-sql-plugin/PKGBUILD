# Contributor: Tilo Brueckner  blueperil at gmx de

pkgname=kate-sql-plugin
_realpkgname=katesql
pkgver=0.2
pkgrel=1
pkgdesc="This is a plugin that transform Kate into a simple, light, versatile and useful SQL client."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/?content=126861"
license=('LGPL')
depends=('kdesdk-kate')
makedepends=('make' 'cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/126861-${_realpkgname}-${pkgver}.tar.gz)
sha256sums=('46069a9f6d983f5928ca0737322f464f70c3aa1261af77e986e0b009a71a3c90')

build() {
  cd $srcdir/${_realpkgname}/

  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
}

package() {
  cd $srcdir/${_realpkgname}/build
  make DESTDIR=$pkgdir install || return 1
}