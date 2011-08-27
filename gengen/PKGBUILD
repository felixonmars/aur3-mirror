# Contributor: Andreas Baumann <abaumann@yahoo.com>

pkgname=gengen
pkgver=1.4.2
pkgrel=1
pkgdesc="A parameterized-text-generator generator based on a template"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gengen/"
license="GPL"
makedepends=('bison' 'flex')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4559df90480d304e127841eb22a54985')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
