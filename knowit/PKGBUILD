
# Contributor: awwakum <awwakum@googlemail.com>
pkgname=knowit
pkgver=0.10
pkgrel=1
pkgdesc="KnowIt is tool for managing notes which are organized in tree-like hierarchy"
arch=('i686')
url="http://knowit.sourceforge.net/index.php"
license=('GPL')
depends=()
source=(http://ovh.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('27a42624f639770fc4f34777b51c5bbf')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

