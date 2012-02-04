# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=stockoid-plasmoid
pkgver=0.4
pkgrel=2
pkgdesc="A plasmoid which lets you display any number of stocks on your KDE 4.1 desktop."
arch=('i686')
url="http://www.kde-look.org/content/show.php/Stockoid?content=86492"
license=('GPL')
depends=('kdebase>=4.1.0')
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/86492-plasma-stockoid-$pkgver.tar.gz)
md5sums=('ab5a7326adb306411cd0b67a2a47a586')

build() {

cd $startdir/src/plasma-stockoid
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$startdir/pkg install || return 1

}
