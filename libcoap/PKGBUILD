# $Id$
# Maintainer: Clément Guérin <geecko.dev@free.fr>

pkgname=libcoap
pkgver=4.1.1
pkgrel=1
pkgdesc="A C implementation of IETF Core Application protocol"
arch=('i686' 'x86_64')
url="http://libcoap.sourceforge.net/"
license=('custom')
depends=('zlib' 'sh')
source=("http://downloads.sourceforge.net/project/$pkgname/coap-18/$pkgname-$pkgver.tar.gz?r=&ts=1396019861")
md5sums=('2ab6daf1f187f02d25b77c39c2ecc56b')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --with-shared
  make
}

check() {
  cd $pkgname-$pkgver

  make check
}

package() {
  cd $pkgname-$pkgver

  install -D -m644 libcoap.so "$pkgdir/usr/lib/libcoap.so"
  for f in *.h; do
    install -D -m644 $f "$pkgdir/usr/include/coap/$f";
  done
  install -D -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
  install -D -m644 LICENSE.GPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL"
}
