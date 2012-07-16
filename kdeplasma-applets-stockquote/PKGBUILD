# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=kdeplasma-applets-stockquote
pkgver=2.1
pkgrel=1
pkgdesc="Displays stock quotes on the desktop pulled from the Yahoo servers"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=90695"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-stockquote-plasmoid')
replaces=('plasma-stockquote-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/90695-plasma_stock_quote-$pkgver.tar.bz2")
md5sums=('ec2099065da1b61bcc8d6c435b87ca79')

build() {
  mkdir build
  cd build
  cmake ../plasma_stock_quote-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}