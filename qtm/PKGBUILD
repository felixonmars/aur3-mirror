# Contributor: Zhukov Pavel
# Maintainer: TrÆ°Æ¡ng XuÃ¢n TÃ­nh <xuantinh@gmail.com>
pkgname=qtm
pkgver=1.3
pkgrel=1
pkgdesc="A blogging client which is presently capable of composing, formatting and submitting blog entries to a weblog"
arch=('i686' 'x86_64')
url="http://qtm.blogistan.co.uk"
license=('GPL')
depends=('qt')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/catkin/qtm-$pkgver.tar.bz2)
md5sums=('bcce02a4eed8f7bace565bd7ad80ef10')

build() {
  cd $startdir/src/qtm-$pkgver
  cmake -D USE_STI:BOOL=TRUE -D CMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
