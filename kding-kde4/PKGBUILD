# $Id$
# Contributor: MeMi69 <lumpilou@gmail.com>

pkgname=kding-kde4
pkgver=0.6
pkgrel=1
pkgdesc="KDing is a KDE4 port of Ding, a dictionary lookup program"
arch=('i686' 'x86_64')
url="http://www.rexi.org/software/kding/"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake')
source=(http://www.rexi.org/downloads/kding/kding-$pkgver.tar.bz2)
md5sums=('539e180da484aa29b3a581046b01b7fe')
build() {
   cd $startdir/src/kding-$pkgver
   mkdir build
   cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release ..
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
