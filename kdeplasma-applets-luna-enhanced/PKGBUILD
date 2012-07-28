# Contributor: Jose Alcalá  <gskbyte AT gmail DOT com>

pkgname=kdeplasma-applets-luna-enhanced
pkgver=1.90
pkgrel=1
pkgdesc="An enhanced version of the original Luna plasmoid, which allows background disabling and custom theme selection."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Luna+enhanced?content=106492"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'boost')
conflicts=('luna-enhanced-plasmoid')
replaces=('luna-enhanced-plasmoid')
source=("http://kde-look.org/CONTENT/content-files/106492-luna-enhanced.tar.gz")
md5sums=('1584388b96623d96deaf9406e209a33d')

build() {
  mkdir build
  cd build
  cmake ../luna-enhanced \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}