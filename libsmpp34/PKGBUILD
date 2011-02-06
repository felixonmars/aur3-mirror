pkgname=libsmpp34
pkgver=1.7.1
pkgrel=1
pkgdesc="A open PDU smpp packaging and unpackaging tool."
arch=('i686' 'x86_64')
url="http://c-smpp.movilgate.com/"
license=('LGPL')
source=(http://c-smpp.movilgate.com/resources/sources/$pkgname-$pkgver.tar.gz)
md5sums=('d8687c16ab0bc9bcd11fb1de63d8ea9e')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
