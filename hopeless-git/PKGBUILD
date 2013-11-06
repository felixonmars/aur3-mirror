# Submitter: perlawk

pkgname=hopeless-git
_pkgname=hopeless
pkgver=0.6
pkgrel=1
pkgdesc="Hopeless is extended HOPE interpreter based on GPLed implementation by Ross Paterson."
arch=('i686' 'x86_64')
url="http://www.hopelog.com/"

license=('GPL')
depends=('')
options=(!strip)

build() {
	cd "$srcdir/"
	if [ ! -e hopeless ] ; then
		git clone https://github.com/shaos/hopeless
	fi
	cd "$srcdir/$_pkgname"
	sed -i 's!/usr/local!/usr!;' Makefile
	sed -i 's!/usr/local!/usr!;' hopelib.h
	make
}

package() {
	cd "$srcdir/$_pkgname"
	
	/usr/bin/install -c -d "$pkgdir"/usr/bin
	/usr/bin/install -c -d "$pkgdir"/usr/share/hopeless
	/usr/bin/install -c -d "$pkgdir"/usr/share/man/man1

	/usr/bin/install -c -s hopeless "$pkgdir"/usr/bin/
	/usr/bin/install -c -m 644 hopeless.1 "$pkgdir"/usr/share/man/man1

	cp lib/*hop "$pkgdir"/usr/share/hopeless
}

