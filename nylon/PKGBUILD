# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=nylon
pkgver=1.21
pkgrel=1
pkgdesc="A proxy server that supports SOCKS v4 and v5"
arch=('i686' 'x86_64')
url="http://monkey.org/~marius/pages/?page=nylon"
license=('unknown')
depends=('libevent')
source=(http://monkey.org/~marius/nylon/$pkgname-$pkgver.tar.gz)
md5sums=('d5de81422b8797afa328f72c694b65bb') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man install
install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
