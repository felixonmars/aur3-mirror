# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libccc
pkgver=0.0.1
pkgrel=1
pkgdesc="A cairo based canvas"
url="http://www.criawips.org"
options=('NOLIBTOOL')
license="LGPL"
depends=('gtk2' 'ruby')
source=(http://download.savannah.gnu.org/releases/criawips/libccc-$pkgver.tar.gz)
md5sums=('eb175682724e4310eefe464038030fa1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk-doc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
