# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=ircproxy
pkgver=1.3.6
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="multi-user IRC bouncer with SSL and IPv6 support"
url="http://ircproxy.sourceforge.net/"
license=('GPL')
depends=('c-ares')
install=ircproxy.install
source=(http://downloads.sourceforge.net/ircproxy/$pkgname-$pkgver.tar.bz2)
md5sums=('fceae6002c82f6bc826dd60af6055341')


build() {
  cd  $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make
}

package() {
  cd  $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
