# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=plasma-miniplayer-plasmoid
pkgver=1.0
pkgrel=2
pkgdesc="A plasmoid for playing multimedia."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Mini+Player?content=95501"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/95501-miniplayer-$pkgver.tar.bz2)
md5sums=('d9dfffedb17b6de7c22416b9f8d4743d')

build() {

cd $srcdir/miniplayer-$pkgver
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

}
