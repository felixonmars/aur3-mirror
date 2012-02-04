# Contributor: Henrik Hallberg <halhen at k2h dot se>
pkgname=smu
pkgver=1.3
pkgrel=1
pkgdesc="smu is a simple interpreter for a simplified markdown dialect."
url="http://s01.de/~gottox/index.cgi/proj_smu"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=()
source=(http://s01.de/~gottox/files/smu/smu-1.3.tar.gz)
md5sums=('fce8a943544b8945f6a23183ecfd0999')

build() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr MANPREFIX=/usr/man DESTDIR=$pkgdir install || return 1
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
