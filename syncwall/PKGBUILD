# Maintainer: Juanma Hernández <juanmah@gmail.com>
# Contributer: giacomogiorgianni@gmail.com

pkgname=syncwall
_pkgname=SyncWall
pkgver=2.0.0
pkgrel=1
pkgdesc="Wallpaper manager with synchronization features"
arch=('i686' 'x86_64')
url="http://syncwall.sourceforge.net/"
license=('GPL')
   if [ "${CARCH}" = 'x86_64' ]; then
	depends=(libqxt qimageblitz)
   elif [ "${CARCH}" = 'i686' ]; then
     depends=(lib32-libqxt qimageblitz)
   fi
makedepends=('cmake' 'dos2unix')
provides=('syncwall')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${_pkgname}-${pkgver}-src.zip")

md5sums=('8a4607921a1b10774bbeff1a201c43e9')

build() {
 cd $srcdir/${_pkgname}-$pkgver-src
  dos2unix tounix.sh
  sh ./tounix.sh
# qmake-qt4 -recursive

 cd $srcdir/${_pkgname}-$pkgver-src/build
   cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr .
   make
}

package() {
cd $srcdir/${_pkgname}-$pkgver-src/build
make install
}

