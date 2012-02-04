# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=teapop
pkgver=0.3.8
pkgrel=2
depends=('perl')
pkgdesc="Teapop is an RFC1939 and RFC2449 compliant POP3-server"
arch=('i686' 'x86_64')
url="http://www.toontown.org/teapop/"
license="GPL"
source=(ftp://ftp.toontown.org/pub/$pkgname/$pkgname-latest.tar.gz)
md5sums=('c322c20018663a1a9b7860966cbd4ed2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr  --sysconfdir=/etc --libexec=/usr/sbin
  make || return 1
  make DESTDIR=$startdir/pkg install
  # rm var, it's empty
  rmdir $startdir/pkg/usr/var
}
