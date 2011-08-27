# Maintainer: Edward Tjörnhammar <xhemi@cube2.se>
# Contributor: Michal Hybner <dta081@gmail.com>
# Additional Contributor: Edward Tjörnhammar <xhemi@cube2.se>
pkgname=xtrlock-pam
pkgver=2.0
pkgrel=1
pkgdesc="Minimal X display locking program"
arch=('i686' 'x86_64')
url="http://packages.debian.org/xtrlock"
license=('GPL')
conflicts=('xtrlock')
replaces=('xtrlock')
depends=('libx11' 'pam')
source=(http://ftp.debian.org/debian/pool/main/x/xtrlock/xtrlock_${pkgver}-12.tar.gz)
md5sums=('be75a389f84fa9548ee04f367480f23e')

build() {
	_S=$startdir/src
  _D=$startdir/pkg
  pushd $_S/${pkgname%%-pam}-$pkgver/
	patch -p1 < ../../pam.patch
	make -f Makefile.noimake CFLAGS="-DSHADOW_PWD" LDLIBS="-lX11 -lcrypt" xtrlock || return 1
	install -D --mode=4755 --verbose xtrlock $_D/usr/bin/xtrlock
	install -D --mode=644 --verbose xtrlock.man $_D/usr/man/man1/xtrlock.1x
  popd
}
