# $Id$
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=skipstone
pkgver=1.0.1
pkgrel=2
pkgdesc="A light and fast GTK+ Web Browser that embeds Mozilla Gecko or Apple WebKit"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.muhri.net/$pkgname/"
depends=('gtk2' 'nspr')
makedepends=()
source=("http://www.muhri.net/$pkgname/$pkgname-$pkgver.tar.gz")
conflicts=()
provides=()
md5sums=('c46548d52b16a809e707a1410566fa0a')

build() {
  cd $srcdir/$pkgname-$pkgver
  autoconf
  ./configure --enable-nls --prefix=$pkgdir/usr --with-localedir=$pkgdir/usr/share/locale/
  make || return 1
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
