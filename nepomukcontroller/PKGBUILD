# Maintainer: nqn1976 @ gmail.com

pkgname=nepomukcontroller
pkgver=0.2
pkgrel=1
pkgdesc="Small systray applet that allows you to suspend and resume the Nepomuk file indexer"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Nepomukcontroller?content=137088"
license=('GPL')
depends=('kdelibs>=4.5.90')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/137088-${pkgname}-${pkgver}.tar.bz2")
md5sums=('7573bc8096f2c211342b745022a7ccdc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .. 
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
