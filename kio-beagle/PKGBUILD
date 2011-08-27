# Contributor: Sergio Rubio <rubiojr@biondofu.net>

pkgname=kio-beagle
pkgver=0.4.0
pkgrel=1
pkgdesc="kio slave to fulltext search files using beagle"
url="http://www.kde-apps.org/content/show.php?content=28437"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdelibs' 'libbeagle')
makedepends=('cmake')
source=("http://www.kde-apps.org/CONTENT/content-files/28437-kio_beagle-${pkgver}.tar.gz")
md5sums=('57b99be17d148168381e7a2f87d0e26a')

build() {
  cd $startdir/src/kio_beagle-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
