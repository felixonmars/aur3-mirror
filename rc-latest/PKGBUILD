# Maintainer: Cyril David <cyx@cyx.is>
pkgname=rc-latest
pkgver=1.7.2
pkgrel=1
pkgdesc="The Plan 9 Shell"
url="http://plan9.bell-labs.com/sys/doc/rc.html"
license=('custom')
arch=('i686' 'x86_64')
depends=('readline')
options=('strip')
source=(http://cyx.is/sh/$pkgname-$pkgver.tgz)
md5sums=('74558874c6a852616b16fcca48db129f')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man --with-readline
  make || return 1
  ./rc < trip.rc || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
  install --mode=755 -d $pkgdir/usr/share/licenses/$pkgname/
  install --mode=644 COPYING $pkgdir/usr/share/licenses/$pkgname/
}
