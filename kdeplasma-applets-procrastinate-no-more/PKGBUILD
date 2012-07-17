# Maintainer: garion < garion @ mailoo.org >

pkgname=kdeplasma-applets-procrastinate-no-more
pkgver=0.2
pkgrel=1
pkgdesc="Plasmoide to keep you from procrastinating"
arch=('i686' 'x86_64')
url="https://gitorious.org/procrastinate-no-more"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('procrastinate-no-more-plasmoid')
replaces=('procrastinate-no-more-plasmoid')
source=("http://kde-apps.org/CONTENT/content-files/142783-procrastinate-no-more-$pkgver.tar.bz2")
md5sums=('0891a144bffc93308fe876d0fa8d7552')

build() {
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
