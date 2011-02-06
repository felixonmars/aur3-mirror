# Contributor: Dave Lepore  dave.lepore at gmx.com

pkgname=dekorator
pkgver=0.5.1
pkgrel=2
pkgdesc="Themable window decorator for KDE SC 4.x."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/deKorator?content=87921"
install=
license=('GPL')
depends=('kdebase-workspace')
makedepends=('make' 'cmake' 'automoc4')
conflicts=()
source=(http://www.kde-look.org/CONTENT/content-files/87921-dekorator-$pkgver.tar.bz2)
md5sums=()
build() {
    cd $srcdir/dekorator-$pkgver
    mkdir build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make DESTDIR=$pkgdir install || return 1
    kbuildsycoca4
}
 
md5sums=('4b88cda85554df436e2cd6ad278ee480')
