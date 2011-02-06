# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=stocks-plasmoid
pkgver=0.4
pkgrel=1
pkgdesc="Displays stock quotes on your plasma enabled desktop."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Stocks?content=87047"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://pansy.at/gernot/plasma-widget-stocks-$pkgver.tar.gz)

build() {

cd $startdir/src/plasma-widget-stocks
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$startdir/pkg install || return 1

}
md5sums=('169ef7b51f0ab63ea19b2d45f2053ff2')
