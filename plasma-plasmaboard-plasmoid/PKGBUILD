# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=plasma-plasmaboard-plasmoid
pkgver=0.91
pkgrel=1
pkgdesc="A virtual keyboard for KDE Plasma that's useful with touchscreens."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Plasmaboard?content=101822"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/101822-plasmaboard-$pkgver.tar.gz)

build() {

cd $srcdir/plasmaboard
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

}
md5sums=('d6df524285112ae5c02ea9d69498499e')
