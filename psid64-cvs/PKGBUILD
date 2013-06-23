# Maintainer: lobotomius at gmail dot com

pkgname=psid64-cvs
pkgver=2013
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('cvs')
pkgdesc="Create C64 executables from PSID files"
url="http://sourceforge.net/projects/psid64/"
license=('GPL2')
source=()

build() {
	cd "$srcdir"

	msg "Connecting to cvs server for psid64"
	if [[ -d psid64 ]]; then
		cd psid64
		cvs -z3 update -d
	else
		cvs -z3 -d:pserver:anonymous@psid64.cvs.sourceforge.net:/cvsroot/psid64 co -P psid64
		cd psid64
	fi

	./autogen.sh
	./configure

	make
}

package() {
	cd "$srcdir/psid64/src"
	mkdir -p "$pkgdir/usr/bin"
	install -D -m755 psid64 -t "$pkgdir/usr/bin"
}
