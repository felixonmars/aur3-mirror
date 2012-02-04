# Contributor: dtw <dibble.at.thewrecker.dot.net> 
# Contributor: Michal Krenek <mikos@sg1.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Anders Lund <anders@alweb.dk>

pkgname=kdestyle-polyester
pkgver=2.0.0
pkgrel=1
pkgdesc="KDE style and window decoration"
url="http://www.kde-look.org/content/show.php?content=27968"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('kdelibs')
makedepends=('automoc4')
options=('libtool')
source=(http://www.notmart.org/files/polyester-$pkgver.tar.bz2)
md5sums=('3794023d4068cbca7b847d5316050c25')


build() {
  cd "$srcdir/polyester-$pkgver"

  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release . || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}
