# Contributor: Jordy van Wolferen <jordz@archlinux.us>

pkgname=htcflasher
pkgver=20080806
pkgrel=2
pkgdesc="Open source RUU for HTC devices"
arch=('i686' 'x86_64')
url="http://code.google.com/p/htc-flasher/"
license="GPL3"
source=(http://htc-flasher.googlecode.com/files/HTCFlasher-$pkgver-1.tar.gz)
md5sums=('d0bcbc2a9dfc931351b4fc487a222bb0')

build() 
{
	cd ${srcdir}/HTCFlasher-$pkgver
	
	if [ "$CARCH" = "x86_64" ]; then
		sed -i 's/m32/m64/g' src/Makefile
	fi
		
	make || return 1
	
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/man/man1
	
	install -m 755 src/HTCFlasher ${pkgdir}/usr/bin/htcflasher
	install -m 755 src/yang ${pkgdir}/usr/bin/yang
	
	install -m 444 man/HTCFlasher.1 ${pkgdir}/usr/share/man/man1/htcflasher.1
	install -m 444 man/yang.1 ${pkgdir}/usr/share/man/man1/yang.1
}
