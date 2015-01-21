# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Maintainer: Bjoern Lindig <bjoern.lindig@gmail.com>

pkgname=pd-jmmmp
_pkg=jmmmp
pkgver=0.3
pkgrel=1
pkgdesc="External for PureData"ls
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
provides=($_origName)
conflicts=($_origName)
groups=('pd-externals')
source=("http://puredata.info/downloads/$_pkg/releases/$pkgver/$_pkg-$pkgver.tar.gz")

build() {
  cd $srcdir/$_pkg-$pkgver

  sed -i 's|usr/local|usr|g' Makefile
  sed -i 's|pd-externals|pd/extra|g' Makefile

  make
}

package() {
  cd $srcdir/$_pkg-$pkgver
  make DESTDIR="$pkgdir/" install
}
md5sums=('a662d2327ac83e08e3ee6524bb318c84')
