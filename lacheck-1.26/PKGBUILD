# Contributor: Jeff Ward <wardjm@clarkson.edu>
pkgname=lacheck
pkgver=1.26
pkgrel=2
pkgdesc="A tool for testing the syntax and formatting of TeX files."
url="http://www.math.ucla.edu/computing/docindex/lacheck-man-1.html"
license="GPL"
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=lacheck.install
source=(http://www.math.utah.edu/pub/lacheck/$pkgname-$pkgver.tar.gz)
md5sums=('a3f2ea68e48e550392e8a4b8f46c2eef')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg install
}
