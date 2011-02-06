# Contributor: Carl Mueller  arch at carlm e4ward com

pkgname=adjustable-clock-plasmoid
pkgver=2.6.1
pkgrel=1
pkgdesc="Customizable kdeplasma clock plasmoid."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Adjustable+Clock?content=92825"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
conflicts=(kde-extragear-plasmoids)
install=$pkgname.install
source=(http://www.kde-look.org/CONTENT/content-files/92825-adjustableclock-$pkgver.tar.bz2)
md5sums=('a688bcfc5bf3a901fa140afea60ed713')
build() {
    cd $srcdir/adjustableclock-$pkgver
    mkdir build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
