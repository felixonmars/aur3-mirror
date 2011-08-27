# Maintainer: Sebastian Wicki <gandro@gmx.net>

pkgname=input-event-daemon
pkgver=0.1.3
pkgrel=2
pkgdesc="A daemon which handles input events such as shortcuts or switches"
arch=('i686' 'x86_64')
url="http://github.com/gandro/input-event-daemon"
license=('custom')
groups=()
depends=('glibc')
makedepends=('linux-api-headers')
source=(
    "http://github.com/gandro/$pkgname/tarball/v$pkgver/$pkgname-$pkgver.tar.gz"
    'input-event-daemon.rc'
)
md5sums=('72f8133df6d7327eb9e6f573d2a68f00'
         '67663462e92cec8c7907203e1af66edd')

build() {
  cd $srcdir/gandro-$pkgname-*/
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -D -m 755 $srcdir/input-event-daemon.rc $pkgdir/etc/rc.d/input-event-daemon
}
