# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=kdeplasma-applets-plasmaboard
pkgver=1.0
pkgrel=1
pkgdesc="A virtual keyboard for KDE Plasma that's useful with touchscreens"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Plasmaboard?content=101822"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-plasmaboard-plasmoid')
replaces=('plasma-plasmaboard-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/101822-plasmaboard-$pkgver.tar.gz")
md5sums=('72860f04885586ec85e4414116bfd628')

build() {
  mkdir build
  cd build
  cmake ../plasmaboard-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}