# Contributor: Ondřej Konečný <konecny.ondrej@seznam.cz>

pkgname=kdeplasma-addons-applet-timoid
pkgver=0.99.1
pkgrel=1
pkgdesc="Countdown timer and stopwatch for KDE4."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Timoid?content=85802"
license=('GPL')
depends=('qt>=4.5' 'kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4' 'patch')
conflicts=()
install=$pkgname.install
source=(http://kde-look.org/CONTENT/content-files/85802-Timoid-$pkgver.tar.bz2)
md5sums=('c1426bff0a7999d11143f15e7075788e')
build() {
    cd $srcdir/Timoid
    mkdir build
    cd build
    patch -p1 ../src/CMakeLists.txt < ../../../CMakeLists.patch
    patch -p1 $srcdir/Timoid/CMakeLists.txt < ../../../CMakeLists2.patch
    cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
} 
