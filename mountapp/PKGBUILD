# Contributor: gh0stwizard <vitaliy.tokarev@gmail.com>

pkgname=mountapp
pkgver=3.0
pkgrel=2
pkgdesc="Mountapp is a dockapp for mounting and unmounting filesystems."
url="http://mountapp.sourceforge.net"
license="GPL"
depends=('libtiff' 'gtk' 'libxpm')
conflicts=()
replaces=()
backup=()
install=
source=(http://mountapp.sourceforge.net/$pkgname-$pkgver.tar.gz)
md5sums=('5e507a88e9144ce241a0d7261d4a1d68')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --exec-prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}
