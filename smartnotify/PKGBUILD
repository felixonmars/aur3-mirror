 # Contributor: sxe <sxxe at gmx dot de>

pkgname=smartnotify
pkgver=0.1.0
pkgrel=2
pkgdesc="Unobtrusive notifications and job views for your plasma desktop. No more annoying popups."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/SmartNotify+(unobtrusive+notifications)?content=133472"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://www.documentroot.net/smartnotify/smartnotify-latest.tar.gz)

build() {
cd $srcdir
mkdir $pkgname-build
cd $pkgname-build

cmake ../$pkgname-$pkgver \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr
make || return 1
make DESTDIR=$pkgdir install || return 1
}


md5sums=('8a93891eb82fec7759d2e19ea18558d8')
