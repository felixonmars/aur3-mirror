# Contributor: Ondřej Konečný <konecny.ondrej@seznam.cz>

pkgname=kdeplasma-applets-timoid
pkgver=0.99.1
pkgrel=1
pkgdesc="Countdown timer and stopwatch for KDE"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Timoid?content=85802"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kdeplasma-addons-applet-timoid')
replaces=('kdeplasma-addons-applet-timoid')
source=("http://kde-look.org/CONTENT/content-files/85802-Timoid-$pkgver.tar.bz2"
	'fix-build.patch')
md5sums=('c1426bff0a7999d11143f15e7075788e'
         '28836de992edd8798fead22fa42f6bd6')

build() {
  cd Timoid
  patch -p1 -i "${srcdir}"/fix-build.patch
  cd ..

  mkdir build
  cd build
  cmake ../Timoid \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

