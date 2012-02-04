# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=tetrinet
pkgver=0.11
pkgrel=3
pkgdesc="Tetrinet client and a simple tetrinet server."
arch=('i686' 'x86_64')
url="http://tetrinet.or.cz/"
license=('Public domain')
depends=('ncurses')
makedepends=('make' 'tar')
conflicts=('tetrinet-git')
source=('http://tetrinet.or.cz/download/tetrinet-0.11.tar.bz2')
md5sums=('73b5197e60bd8e7fcf0765f9c91e9034')

build() {
	cd $srcdir

	tar -xjvf tetrinet-0.11.tar.bz2
	cd tetrinet-0.11

	make || return 1
	mkdir -p ${pkgdir}/usr/bin
	install -m755 $startdir/src/tetrinet-0.11/tetrinet ${pkgdir}/usr/bin
	install -m755 $startdir/src/tetrinet-0.11/tetrinet-server ${pkgdir}/usr/bin

	mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/$pkgname/src
}
