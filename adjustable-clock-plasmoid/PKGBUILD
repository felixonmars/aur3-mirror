# Contributor: Carl Mueller  arch at carlm e4ward com

pkgname=adjustable-clock-plasmoid
pkgver=3.0
pkgrel=1
pkgdesc="Customizable kdeplasma clock plasmoid."
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php/Adjustable+Clock?content=92825"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=(kde-extragear-plasmoids)
source=(http://www.kde-look.org/CONTENT/content-files/92825-adjustableclock-$pkgver.tar.bz2)
md5sums=('cfe84573db8814edbfec5bcf8a29f4ee')
build() {
    cd $srcdir/adjustableclock-$pkgver
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
    make
    make DESTDIR=$pkgdir install
}
