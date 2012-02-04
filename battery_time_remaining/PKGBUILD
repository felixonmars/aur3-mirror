# Contributor: Martin Stolpe <martinstolpe {at} gmail ... com>
pkgname=battery_time_remaining
pkgver=0.4
pkgrel=1
pkgdesc="Battery Remaining Time Display Widget for KDE 4"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Battery+Time+Remaining?content=123767"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'gcc')
source=(http://kde-look.org/CONTENT/content-files/123767-plasma-batterytime-monochrome-${pkgver}.tar.gz)
install=(battery_time_remaining.install)

build() {
  cd "$srcdir"

  [[ -d ${srcdir}/build ]] && rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release ${srcdir}/plasma-batterytime-monochrome-${pkgver}
  make || return 1
  make DESTDIR="$pkgdir/" install
}
md5sums=('353a113b2aa504ba6d716f606a97ee22')
