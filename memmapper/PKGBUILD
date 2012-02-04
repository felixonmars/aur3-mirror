# Maintainer: Giuseppe Calderaro <giuseppecalderaro@gmail.com>

pkgname=memmapper
pkgver=git
pkgrel=1
pkgdesc="Memory mapper tool. The swiss army knife for the DD developer."
arch=('i686' 'x86_64')
url="http://github.com/giuseppecalderaro/memmapper"
depends=('udis86' 'git')
license=('GPL')
source=()
md5sums=()

build() {
	cd $startdir/src/

	git clone git://github.com/giuseppecalderaro/memmapper.git
	cd $pkgname
	DISASM=y make || return 1
	install -D -m755 $startdir/src/$pkgname/memmapper $startdir/pkg/usr/sbin/memmapper || return 1
}
