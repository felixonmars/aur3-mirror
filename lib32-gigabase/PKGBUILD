# Maintainer: Milo Hyben <milo.hyben@datanoesis.com>

_pkgbasename=gigabase
pkgname=lib32-$_pkgbasename
pkgver=3.82
pkgrel=2
pkgdesc="Object-relational embedded database engine created by K. Knizhnik. (32-bit)"
arch=('x86_64')
url="http://sourceforge.net/projects/gigabase"
license=('MIT')
depends=('gcc-libs-multilib')
makedepends=('unzip' 'make' 'gcc-multilib')
optdepends=('zlib')
provides=('gigabase')
options=(!libtool)
source=(
"http://sourceforge.net/projects/gigabase/files/gigabase-src/$pkgver/gigabase-$pkgver.tar.gz"
LICENSE)

build() {
  cd "$srcdir/$_pkgbasename"
  ./configure --prefix=/usr --libdir=/usr/lib32 CXX='g++ -m32'  CC='gcc -m32'
  make
}

package() {
  cd "$srcdir/$_pkgbasename"
  make prefix="$pkgdir/usr/" install

  # Clean up, only libraries needed
  rm -rf ${pkgdir}/usr/{bin,include}

  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('a3c2d8b03a78e04e59953ad24afd6ca6'
         '8987cd8f40a6fe430cb24687b85fc2f2')

