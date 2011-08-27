# Contributor: shamrok <szamrok@gmail.com>

pkgname=katapult-fasttrack
pkgver=0.1.2
pkgrel=2
pkgdesc="Allows faster access to applications, bookmarks, and other items (fork of katapult)"
arch=('i686')
url="http://www.kde-apps.org/content/show.php/show.php?content=60941"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake')
source=("http://www.kde-apps.org/CONTENT/content-files/60941-$pkgname-$pkgver.tar.bz2")
md5sums=('3f28abb3c5bd97481f4ecf585e71b66b')
conflicts=('katapult')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/opt/kde -DREALTRANSPARENCY=1
  make || return 1
  make DESTDIR=$startdir/pkg install      
}
