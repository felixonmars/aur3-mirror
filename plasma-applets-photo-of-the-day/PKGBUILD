# Contributor: Carl Mueller  archlinux at carlm e4ward com
# Contributor: Michael Serpieri contact at pygoscelis dot org

pkgname=plasma-applets-photo-of-the-day
pkgver=2.1.1
pkgrel=2
pkgdesc="Kdeplasma plasmoid to display photo of the day"
arch=('any')
url="http://www.kde-look.org/content/show.php/Photo+of+the+Day?content=104631"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/104631-v${pkgver}.tar.gz)
md5sums=('2cdf92909254140a532c5b93bc6e6e30')

build() {
  cd $srcdir/v$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
  make DESTDIR=$pkgdir install
}
