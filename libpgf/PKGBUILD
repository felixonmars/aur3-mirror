# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=libpgf
pkgver=6.14.12
pkgrel=1
pkgdesc="A new progressive file format for lossy and lossless image compression."
arch=('i686' 'x86_64')
url="http://www.libpgf.org"
depends=('gcc-libs')
makedepends=('dos2unix')
license=('GPL')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver-latest/$pkgname-src-$pkgver.tar.gz")
md5sums=('a2b13832e23ad9026bd249d57b6c26da')

build() {
  cd "$srcdir"/$pkgname
  dos2unix configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname
  make install PREFIX=/usr DESTDIR=$pkgdir
}
