#Contributor: MeMi69 <lumpilou AT gmail DOT com>

pkgname=kdeplasma-applets-on-off-switch
pkgver=0.2
pkgrel=1
pkgdesc="Simple plasmoid that executes commands when the switch is toggled"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/On%2BOff+Switch?content=116323"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('on-off-switch-plasmoid')
replaces=('on-off-switch-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/116323-on_off_switch-$pkgver.tar.bz2")
md5sums=('89c9fd72bd1a52911bfac73dc86f2a1d')

build() {
  mkdir build
  cd build
  cmake ../on_off_switch-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}