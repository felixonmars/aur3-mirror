# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=dpkg-ubuntu
_pkgname=dpkg
pkgver=1.15.8.4ubuntu3.1
pkgrel=2
pkgdesc="The Debian Package Manager.  Don't use it instead of Arch's 'pacman'. For build ubuntu package"
arch=('i686' 'x86_64')
url='http://packages.debian.org/${pkgname}'
license=('GPL')
depends=('bzip2' 'perl-timedate')
makedepends=('gcc' 'make')
optdepends=('fakeroot')
replaces=(dpkg)
conflits=(dpkg)
#options=(!emptydirs)
source=(http://archive.ubuntu.com/ubuntu/pool/main/d/$_pkgname/dpkg_$pkgver.tar.bz2)

md5sums=('ba30b2d5e73830c5dbaf520e38d03afe')




build() {
	cd ${_pkgname}-${pkgver}

	# Config
	sed -i 's|<ncursesw/curses.h>|<curses.h>|g' dselect/{dselect.h,Makefile.in} || return 1
	sed -i 's|<ncursesw/term.h>|<term.h>|g' dselect/main.cc || return 1

	# Build
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --without-start-stop-daemon || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1

	# Variables
	install -d ${pkgdir}/var/${_pkgname}/updates/
	#touch ${pkgdir}/var/lib/${_pkgname}/{status,available}
}
