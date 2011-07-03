# Contributor: Uwe Hofmann (karoshiboy) karoshi at archlinux us

pkgname=plasmoid-ebayitem
pkgver=0.1.7
pkgrel=1
pkgdesc="Plasmoid for ebay item."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=129460"
license=('BSD')
depends=('kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
conflicts=()
source=(http://www.moben.ru/download/plasmoid-for-ebay-item-$pkgver.tgz)
md5sums=('a932f3e0913ea58b012f56c0d98ede50')
build() {
    cd $srcdir/plasmoid-for-ebay-item-$pkgver
    mkdir build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}

