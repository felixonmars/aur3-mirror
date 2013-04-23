# Maintainer: Rodney Price <rod@thirdoption.info>
pkgname=datalog
pkgver=2.4
pkgrel=1
pkgdesc="A deductive database system for memory-constrained devices."
arch=('i686' 'x86_64')
url="http://www.ccs.neu.edu/home/ramsdell/tools/datalog/"
license=('LGPL')
groups=()
depends=('lua>=5.1')
provides=('datalog')
conflicts=()
options=()
install=datalog.install
source=("http://sourceforge.net/projects/datalog/files/datalog/$pkgver/datalog-$pkgver.tar.gz/download")
md5sums=('360cc12a6365a7f752864490dd8031d7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-lua
  make
  make pdf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-pdf
}

# vim:set ts=2 sw=2 et:
