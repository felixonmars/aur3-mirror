pkgname=simplemod
pkgver=1.0
pkgrel=1
pkgdesc="simplemod is a minimalistic module player. It was designed to be used by a frontend and thus it's output is easy to parse."
url="http://borderworlds.dk/projects/#sm"
license="GPL"
depends=('libmikmod')
source=(http://borderworlds.dk/projects/sm/$pkgname-$pkgver.tar.gz)
md5sums=('0752fe3cce00152be233ac506f2a1257')
arch=('i686')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp simplemod $startdir/pkg/usr/bin
}
