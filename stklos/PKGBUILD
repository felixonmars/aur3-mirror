# Contributor: e.samovar <e.samovar@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=stklos
pkgver=1.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Scheme VM almost compliant to the R5RS standard"
url="http://www.stklos.net"
license=('GPL')
depends=('gmp' 'pcre' 'gc' 'libffi')
source=(http://www.stklos.net/download/$pkgname-$pkgver.tar.gz)
md5sums=('55b709bf56d2e6b16fe5e1a10c1a9013')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc 
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install 
  install -Dm644 $pkgdir/usr/etc/$pkgname/Makefile-scmpkg.tmpl \
    $pkgdir/etc/$pkgname/Makefile-scmpkg.tmpl
  rm -r $pkgdir/usr/etc
}
