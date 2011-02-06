# Contributor: Zephyr
pkgname=kradioripper
pkgver=0.6
pkgrel=1
pkgdesc="KDE program for ripping internet radios based on StreamRipper"
arch=('i686' 'x86_64')
depends=('kdelibs' 'qt' 'bzip2' 'libxft' 'streamripper')
makedepends=('cmake' 'automoc4')
url="http://www.kde-apps.org/content/show.php/KRadioRipper?content=78068"
license=('GPL')
source=(http://kent.dl.sourceforge.net/sourceforge/kradioripper/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e628285c37a1dfd40b231d3bf1af6d46')

build() {
  cd ${srcdir}
  mkdir build
  cd build

  cmake ../${pkgname} -DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_TYPE=Release \
	-DWITHOUT_LIBPROXY=YES || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
