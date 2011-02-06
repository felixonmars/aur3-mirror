# Contributor: bakthariq <bakthariq at gmail dot com>

pkgname=kprayertime4
pkgver=4.01
pkgrel=1
pkgdesc="A KDE plasmoid that displays the Islamic prayer times for the day"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/KPrayertime4+Islamic+Prayer+Times?content=117387"
license=('GPL')
depends=('qt>=4.5' 'kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
install=$pkgname.install
source=(http://jaist.dl.sourceforge.net/project/kprayertime/kprayertime4-src/kprayertime4.01.src.tar.gz)
md5sums=(098682e4b6c6b5b1f5caf68f4d3ca412)

build() {
    cd $srcdir/src
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
