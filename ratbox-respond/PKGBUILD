# Maintainer: ManiacTwister <arch@s7t.de>

pkgname=ratbox-respond
pkgver=1.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="ratbox-respond is a tool that provides a client side implementation of the challenge opering system in ircd-ratbox"
url="http://respond.ratbox.org"
license=('GPL')
depends=('openssl')
source=($url/download/$pkgname-$pkgver.tgz)
md5sums=('5af3619e8985b697180907109185231f')

build() {
  cd "$srcdir/$pkgname-$pkgver/ratbox-respond"

  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/ratbox-respond"
  mkdir -p $pkgdir/usr/bin/
  cp ratbox-respond $pkgdir/usr/bin/ratbox-respond
}
