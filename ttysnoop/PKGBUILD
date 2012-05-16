pkgname=ttysnoop
pkgver=0.12d.k26
pkgrel=4
pkgdesc="a program that allows an administrator to snoop on login terminals"
arch=('i686' 'x86_64')
license=('unknown')
url="http://sysd.org/stas/node/35"
backup=('etc/snooptab')
depends=('glibc')
install=$pkgname.install
source=(http://sysd.org/stas/files/active/0/$pkgname-$pkgver.tar.gz)
md5sums=('a5bb3c5eb145d752aa3b1ec7b2775544')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 -s ttysnoop "$pkgdir/sbin/ttysnoop"
  install -D -m755 -s ttysnoops "$pkgdir/sbin/ttysnoops"
  install -D -m644 ttysnoop.8 "$pkgdir/usr/man/man8/ttysnoop.8"
  install -D -m644 snooptab.dist "$pkgdir/etc/snooptab"
}
