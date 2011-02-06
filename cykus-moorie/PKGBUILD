# Contributor: trux <mmaruszewicz@tlen.pl>
pkgname=cykus-moorie
pkgver=e80f339
pkgrel=1
pkgdesc="Moorhunt-compatible, lightweight file-sharing client for Linux"
arch=('i686' 'x86_64')
url="http://moorie.pl/"
license=('GPL')
depends=(mcrypt boost gmime curl)
makedepends=(autoconf automake cmake)
provides=()
conflicts=(moorie-devel)
source=(http://github.com/cykus/moorie/tarball/master/$pkgname-$pkgver.tar.gz)
md5sums=('86342f0b9c1afb086654292b701be510') 
build() {
  cd "$startdir/src/$pkgname-$pkgver"
    cmake -DENABLE_GUI=ON -DCMAKE_INSTALL_PREFIX=/usr .   

  make || return 1
  make DESTDIR="$startdir/pkg" install
}
