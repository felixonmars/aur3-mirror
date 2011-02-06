# Maintainer: Josip <josipponjavic at gmail dot com>
# Contributor:

pkgname=terranova
pkgver=0.50~pre1
pkgrel=1
pkgdesc="A highly customizable engine."
source=(http://download.tuxfamily.org/terranova/TerraNova-$pkgver.tar.bz2)
url="http://www.nanolx.org/newsnanolx/11-terranova"
license=('GPL')
depends=('gtk2')
makedepends=('pkgconfig' 'automake' 'intltool')
md5sums=('af23c499badca7efddfb188d2514cb5d')

arch=('i686' 'x86_64')

build() {
  cd $srcdir/TerraNova-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
