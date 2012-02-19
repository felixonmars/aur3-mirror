# $Id$
# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=inputattach-wacom5
pkgver=1.24
pkgrel=4
pkgdesc="Attach serial mice, keyboards and other input devices to the kernel input system, with Wacom protocol V support"
arch=('i686' 'x86_64')
url="http://linuxconsole.sourceforge.net/"
license=('GPL')
depends=('bash')
conflicts=('inputattach')
makedepends=('gcc')
backup=(etc/conf.d/inputattach)
install=inputattach.install
#source=('http://kernel.org/pub/linux/kernel/people/dtor/inputattach.c'
#	'http://kernel.org/pub/linux/kernel/people/dtor/serio-ids.h'
source=('http://arch.p5n.pp.ru/~sergej/dl/2011/inputattach.c'
	'http://arch.p5n.pp.ru/~sergej/dl/2011/serio-ids.h'
	'inputattach.conf.d'
	'inputattach.rc.d'
	'0001-Add-w8001-flag.patch'
	'0002-Allow-for-custom-baud-rates.patch'
	'0003-Add-protocol-v-support.patch')
md5sums=('eb595a766ca363edb3b14c25404596ce'
         '93d34d96cd3ad19ea1aeca7f68a66b4a'
         '7ca903e54829764c8241233af5069216'
         'aa2e404fc113abdd2ab14e2a6352c331'
         'f1b3ddae308351357f557cbd5c6cda81'
         '8f76908449cae24a95adbf0bc0a17721'
         '366ff144e617065889496787223edc84')

build() {
  cd "$srcdir"
  # Add support for serial wacom tablets
  patch -Np1 -i "$srcdir/0001-Add-w8001-flag.patch"
  patch -Np1 -i "$srcdir/0002-Allow-for-custom-baud-rates.patch"
  patch -Np1 -i "$srcdir/0003-Add-protocol-v-support.patch"
  cc $CFLAGS inputattach.c -o inputattach
}

package() {
  cd "$srcdir"
  install -Dm755 inputattach "$pkgdir/usr/sbin/inputattach"
  install -Dm644 $srcdir/inputattach.conf.d "$pkgdir/etc/conf.d/inputattach"
  install -Dm755 $srcdir/inputattach.rc.d "$pkgdir/etc/rc.d/inputattach"
}
