pkgname=pidentd
pkgver=3.0.19
pkgrel=4
pkgdesc="A program that implements the RFC1413 identification server"
arch=('i686' 'x86_64')
source=(http://ftp.de.debian.org/debian/pool/main/p/$pkgname/${pkgname}_${pkgver}.ds1.orig.tar.bz2
        identd
        identd.conf)
md5sums=('e042ae308b527830a20e0e444ebac829'
         'fe9c3f11e10314ff44eccd28a08c58b1'
         '795fdcbfd10dd4db520f96f01614e59c')
depends=('glibc' 'openssl>=0.9.8b')
license=('custom')
backup=(etc/identd.conf)
url="http://www.lysator.liu.se/~pen/pidentd/"

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make prefix="$pkgdir/usr" install
  install -D -m644 $srcdir/identd $pkgdir/etc/rc.d/identd
  install -D -m644 $srcdir/identd.conf $pkgdir/etc/identd.conf
  install -d $pkgdir/usr/share/licenses/$pkgname/
  head -14 src/main.c > $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
# vim: ts=2 sw=2 et ft=sh
