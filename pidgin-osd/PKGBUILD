# Contributor: Abakus <java5@arcor.de>

pkgname=pidgin-osd
pkgver=0.1.0
pkgrel=2
pkgdesc="print events on the X root screen on receiving incoming messages from pidgin"
url="http://babelize.org/pidgin-osd.php"
license="GPL"
arch=('i686' 'x86_64')
depends=('xosd' 'pidgin')
source=(http://babelize.org/download/pidgin-osd/$pkgname-$pkgver.tar.gz)
md5sums=('592770c0d3bca144123d8e9a21588940')


build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
