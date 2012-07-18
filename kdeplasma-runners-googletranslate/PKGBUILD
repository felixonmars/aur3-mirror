# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-runners-googletranslate
pkgver=0.1
pkgrel=1
pkgdesc="A krunner plug-in that translates words using google"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/krunner-googletranslate?content=144348"
license=('GPL2')
depends=('kdebase-workspace' 'qjson')
makedepends=('cmake' 'automoc4')
conflicts=('google-translate-runner' 'kdeplasma-addons-runners-googletranslate')
replaces=('google-translate-runner' 'kdeplasma-addons-runners-googletranslate')
source=("http://kde-apps.org/CONTENT/content-files/144348-krunner-googletranslate-${pkgver}.tbz2")
md5sums=('fcb8aaa990a22e70b88608401d9b2d7d')

build() {
  mkdir build
  cd build
  cmake ../krunner-googletranslate \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}