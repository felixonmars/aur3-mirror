# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=pen
pkgver=0.18.0
pkgrel=1
pkgdesc="a load balancer for "simple" tcp based protocols such as http or smtp."
arch=('i686' 'x86_64')
url="http://siag.nu/pen"
license=('GPL2')
depends=('bash')
source=(http://siag.nu/pub/pen/$pkgname-$pkgver.tar.gz)
md5sums=('96f6d39e7e7cca11a647e795550f3829') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man/ docdir=$pkgdir/usr/share/doc/$pkgname install
}

# vim:set ts=2 sw=2 et:
