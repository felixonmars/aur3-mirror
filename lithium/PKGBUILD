# Contributor: Mateusz Krasowski <matkras@gmail.com>
pkgname=lithium
pkgver=0.1.1
pkgrel=1
pkgdesc="Lithium Power Manager for KDE4"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=86943"
license=('GPL')
depends=('kdebase-workspace>=4' 'libxcb' 'libxss')
makedepends=('automoc4' 'cmake')
source=(http://kde-apps.org/CONTENT/content-files/86943-li-0.1.1.tar.bz2)
md5sums=('12b7ffb14e0659d7266f45e493697cbb')

build() {
    cd li-0.1.1
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
