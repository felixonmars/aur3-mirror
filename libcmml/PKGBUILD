# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libcmml
pkgver=0.9.2
pkgrel=1
pkgdesc="A C library that parses XML in CMML"
arch=('i686' 'x86_64')
url="http://www.annodex.net/software/libcmml"
options=('NOLIBTOOL')
license="custom"
depends=('expat')
source=(http://www.annodex.net/software/libcmml/download/libcmml-$pkgver.tar.gz)
md5sums=('44a1575a91ad32100df215766ca95b83')

build() {
  cd $startdir/src/libcmml-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  mv doc/*.1 $startdir/pkg/usr/man/man1
  mv doc/*.6 $startdir/pkg/usr/man/man6

  install -D COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
