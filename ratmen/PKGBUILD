# Contributor: Emmanuele Massimi <finferflu@gmail.com>
pkgname=ratmen
pkgver=2.2.3
pkgrel=1
pkgdesc="Display a simple X menu consisting of user defined entries"
arch=('i686' 'x86_64')
url="http://ratpoison.antidesktop.net/cgi-bin/wiki/ratmen"
license=('GPL')
depends=('perl' 'libx11')
source=(http://www.update.uu.se/~zrajm/programs/ratmen/$pkgname-$pkgver.tar.gz)
md5sums=('4cc8de0f3138d9eacb06f08292df6294')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  pod2man ./ratmen.c > ratmen.1
  make || return 1
  make PREFIX="$startdir/pkg/usr" install
}
