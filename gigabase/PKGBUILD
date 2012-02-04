# Maintainer: Milo Hyben <milo.hyben at datanoesis dot com>
pkgname=gigabase
pkgver=3.82
pkgrel=1
pkgdesc="Object-relational embedded database engine created by K. Knizhnik."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gigabase"
license=('MIT')
depends=('gcc-libs')
makedepends=('unzip' 'make' 'gcc')
optdepends=('zlib')
provides=('gigabase')
options=(!libtool)
source=(
"http://sourceforge.net/projects/gigabase/files/gigabase-src/$pkgver/gigabase-$pkgver.tar.gz"
LICENSE)

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package() {
  cd "$srcdir/$pkgname"

  make prefix="$pkgdir/usr/" install
}

md5sums=('a3c2d8b03a78e04e59953ad24afd6ca6'
         '8987cd8f40a6fe430cb24687b85fc2f2')
