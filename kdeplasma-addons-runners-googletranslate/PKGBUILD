pkgname=kdeplasma-addons-runners-googletranslate
_pkgname=krunner-googletranslate
pkgver=0.1
pkgrel=1
pkgdesc="A krunner plug-in that translates words using google."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/krunner-googletranslate?content=144348"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'qjson')
source=("http://kde-apps.org/CONTENT/content-files/144348-${_pkgname}-${pkgver}.tbz2")
md5sums=('fcb8aaa990a22e70b88608401d9b2d7d')
conflicts=('google-translate-runner')
provides=('google-translate-runner')
 
build() {
  cd "${srcdir}/${_pkgname}"
  [ -d build ] && rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
} 
