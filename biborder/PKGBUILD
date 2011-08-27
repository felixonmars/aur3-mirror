# Maintainer: Caleb Reach <caleb.reach@codphilosophy.com>

pkgname=biborder
pkgver=0.12
pkgrel=1
pkgdesc="BibTeX bibliography file key/value pair order standardizer"
arch=('i686' 'x86_64')
license=(GPL3)
url="http://ftp.math.utah.edu/pub//$pkgname/"
source=(http://ftp.math.utah.edu/pub//$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1bf68b6734ded0e0f2a69d216a00213e')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
  mkdir -p $pkgdir/usr/{bin,man/man1,share/lib}
  make prefix=$pkgdir/usr CP='cp -p' install
}
