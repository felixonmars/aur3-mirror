# author: Alessandro  Preziosi
# PKGBUILD contributor: dodox

pkgname=kdeplasma-applets-eyesaver
pkgver=0.4
pkgrel=1
pkgdesc="This plasmoid has been made to remind us to take our eyes off the screen sometimes"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Eyesaver?content=89989"
license=('GPL') 
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('89989-eyesaver')
replaces=('89989-eyesaver')
source=("http://kde-look.org/CONTENT/content-files/89989-eyesaver-${pkgver}.tar.gz")
md5sums=('4ca916b88396d4b8b3198006c8302ea4')
 
build() {
  mkdir build
  cd build
  cmake ../eyesaver-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}