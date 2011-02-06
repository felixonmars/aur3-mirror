# Contributor: Adria Arrufat <swiftscythe@gmail.com>

 pkgname=battery-remaining-plasmoid
 pkgver=4.6
 pkgrel=1
 pkgdesc="Battery plasmoid with remaining time"
 arch=('i686' 'x86_64')
 url="http://kde-look.org/content/show.php/battery+plasmoid+with+remaining+time?content=120309"
 license=('GPL')
 depends=('kdebase-workspace')
 makedepends=('make' 'cmake' 'automoc4')
 conflicts=()
 source=(http://kde-look.org/CONTENT/content-files/120309-plasmoid-battery-$pkgver.tar.gz)
 md5sums=('8adc4c69d9e18f14f4e06f87ba812bc2')
 build() {
   cd $srcdir/plasmoid-battery-$pkgver/
   mkdir build
   cd build
   cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
   make || return 1
   make DESTDIR=$pkgdir install || return 1
         }
