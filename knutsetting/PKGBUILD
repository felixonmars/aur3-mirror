# Contributer: giacomogiorgianni@gmail.com 

pkgname=knutsetting
pkgver=0.2
pkgrel=1
pkgdesc="Knutsetting is a visual KDE tool for setting of UPS system NUT - Network UPS Tools"
#url="http://www.knut.noveradsl.cz/knutclient/"
url="http://opendesktop.org/content/show.php/KnutSetting?content=158051"
arch=('i686' 'x86_64')
license=('GPL')
depends=("kdelibs")
makedepends=('cmake' 'automoc4')
source=(http://knut.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('2cba9152e5d37c8522b26124477ab245')
install=${pkgname}.install

build() {
  cd $srcdir/$pkgname-$pkgver
  cd build
  cmake ../. -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
}