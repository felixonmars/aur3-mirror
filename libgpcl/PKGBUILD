#Contributor: Jason Taylor <jftaylor21@gmail.com>

pkgname=libgpcl
pkgver=2.32
pkgrel=1
pkgdesc="General Polygon Clipper Library"
url="http://www.cs.man.ac.uk/~toby/alan/software/"
license=""
depends=()
makedepends=(gcc)
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.cs.man.ac.uk/pub/toby/gpc/gpc232.zip)
md5sums=('e8ede167d810f26cf01f760a8824e2c9')

build() {
  cd $startdir/src/gpc232
  gcc -c *.c
  ar rv libgpcl.a *.o
  mkdir -p $startdir/pkg/lib
  cp libgpcl.a $startdir/pkg/lib
}
