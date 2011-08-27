# Contributor: Glenn Matthys <glenn@opengate.be>
# Maintainer: Glenn Matthys <glenn@opengate.be>
pkgname=gps-postfix
pkgver=1.005
pkgrel=1
pkgdesc="GPS is an implementation of a greylist policy service for the postfix MTA"
arch=('i686'  'x86_64')
url="http://mimo.gn.apc.org/gps/index.shtml"
license=('GPL')
groups=()
depends=('libdbi' 'gcc-libs')
makedepends=('libdbi' 'gcc-libs')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/greylist/gps-$pkgver-bugfix.tar.gz)
noextract=()
md5sums=('e791679e05c9dd22ed255d262a0ea918')

build() {
	cd "$startdir/src/release-$pkgver"
	automake --add-missing
	make -f Makefile.cvs
	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$startdir/pkg" install
	
	# Copy example configuration file to /etc
	mkdir -p $startdir/pkg/etc
	cp etc/gps.conf $startdir/pkg/etc/gps.conf
}

# vim:set ts=2 sw=2 et:
