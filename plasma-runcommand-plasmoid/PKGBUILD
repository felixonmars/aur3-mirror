# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=plasma-runcommand-plasmoid
pkgver=2.4
pkgrel=1
pkgdesc="A convenient plasmoid to run commands without using a terminal or KRunner."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Run+Command?content=91495"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/91495-runcommand-$pkgver.tar.bz2)

build() {

cd $srcdir/runcommand-$pkgver
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1
}
md5sums=('e93ea7202ad3cd26a5e05e9f5401c033')
