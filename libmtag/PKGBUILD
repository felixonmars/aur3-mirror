# Contributor: Mark Baran <mebaran@gmail.com>
pkgname=libmtag
pkgver=0.2.0
pkgrel=1
pkgdesc="libmtag is an extensible music tagging library built on "
arch=('i686' 'x86_64')
url="http://code.google.com/p/libmtag/"
license=('LGPL')
groups=
provides=
depends=('taglib')
makedepends=('gcc')
source=(http://libmtag.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('a580a1ee4b5043e5e22afaef90823b6d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make install prefix=$startdir/pkg/usr install
}
