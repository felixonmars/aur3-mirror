# Contributor: lydgate
# Contributor: Filip Wojciechowski, filip at loka dot pl

pkgname=cuegen
pkgver=1.2.0
pkgrel=3
pkgdesc="FLAC-compatible cuesheet generator for Linux"
arch=('i686' 'x86_64')
url="http://www.cs.man.ac.uk/~slavinp/cuegen.html"
license=('GPL')
depends=()
source=(http://www.cs.man.ac.uk/~slavinp/files/$pkgname-$pkgver.tar.gz)
md5sums=('61c21371a5eaf47e178a9c44ec42485e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
}

