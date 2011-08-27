# Contributor: <archist@gmx.de>
pkgname=xorg-keyboard-de
pkgver=1.8.0
pkgrel=1
pkgdesc="German keyboard layout configuration with no dead keys"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('xorg-server')
url=("http://www.x.org")
source=(keyboard.conf)
md5sums=('be33f551434fd9135cfca3a029c90007')
build() {
	mkdir -p  $startdir/pkg/etc/X11/xorg.conf.d/
	install -m 644 $startdir/keyboard.conf $startdir/pkg/etc/X11/xorg.conf.d/
}
