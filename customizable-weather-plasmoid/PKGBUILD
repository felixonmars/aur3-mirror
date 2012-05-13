# Maintainer: Carl Mueller  archlinux at carlm e4ward com

pkgname=customizable-weather-plasmoid
pkgver=1.6.2
pkgrel=1
pkgdesc="Kdeplasma weather widget with lots of customization, also called cwp"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php/Customizable+Weather+Plasmoid?content=98925"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=(kde-extragear-plasmoids)
source=(http://www.kde-look.org/CONTENT/content-files/98925-cwp-$pkgver.tar.bz2)
md5sums=('a05028a20e0075785ffbbf68b856805e')
build() {
  cd $srcdir/cwp-$pkgver/
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
  make DESTDIR=$pkgdir install
}
