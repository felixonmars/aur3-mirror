# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=kdeplasma-applets-onelinecalculator
pkgver=0.3
pkgrel=1
pkgdesc="A lineedit KDE plasmoid calculator"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/One-Line+Calculator?content=89524"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('onelinecalculator')
replaces=('onelinecalculator')
source=("http://www.kde-look.org/CONTENT/content-files/89524-onlinecalc-$pkgver.tar.gz")
md5sums=('da67dbc41d7bd5b64954a1732adfd2e1')

build() {
  mkdir build
  cd build
  cmake ../onlinecalc \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}