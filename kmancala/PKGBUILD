# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=kmancala
pkgver=1.0.2
pkgrel=2
pkgdesc="kMancala is an implementation of board game known as Kalaf, aka Mancala."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/kMancala?content=142045"
license=('GPL2')
depends=('libkdegames')
makedepends=('automoc4')
source=(http://horinek.net/~dal/kMancala-$pkgver.tar.bz2)
md5sums=('e05705470c680e57a569e2fb471f5902')


build() {
  cd $srcdir/kMancala-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $srcdir/kMancala-$pkgver

  make DESTDIR=$pkgdir install
}
