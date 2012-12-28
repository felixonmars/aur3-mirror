# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>

pkgname=bbe
pkgver=0.2.2
pkgrel=1
pkgdesc="A sed-like editor for binary files"
arch=('i686' 'x86_64')
url="http://bbe.sourceforge.net/"
license=('GPL')
depends=('glibc')
install=bbe.install
source=(http://downloads.sourceforge.net/$pkgname-/$pkgname-$pkgver.tar.gz)
md5sums=('b056d0bfd852384aced73d4533887d4b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
