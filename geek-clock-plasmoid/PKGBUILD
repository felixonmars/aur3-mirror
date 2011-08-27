# Contributor: Vitaliy Ivanov <wicharek@gmail.com>

pkgname=geek-clock-plasmoid
pkgver=1.0
pkgrel=1
pkgdesc="Plasmoid for KDE 4 depicting the Geek Clock."
arch=('i686' 'x86_64')
url="http://w2f2.com/projects/geekclock"
license=('GPL')
depends=('qt>=4.5' 'kdebase' 'kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
install=$pkgname.install
source=(http://w2f2.com/projects/geekclock/geek-clock-plasmoid-$pkgver-src.tar.gz)
md5sums=('0606169b6811327358987f52fbbe1ebb')
build() {
    cd $srcdir/geek-clock-plasmoid-$pkgver-src
    mkdir build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
