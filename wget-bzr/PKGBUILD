# AUR Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# AUR Maintainer: Caleb Cushing <xenoterracide@gmail.com>
# Arch Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=wget-bzr
pkgver=2608
pkgrel=3
pkgdesc="A network utility to retrieve files from the Web"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/wget/wget.html"
license=('GPLv3')
groups=('base')
depends=('glibc' 'openssl' 'gnutls')
makedepends=('bzr')
provides=('wget')
conflicts=('wget')
optdepends=('ca-certificates: HTTPS downloads')
backup=("etc/wgetrc")
install=wget.install

_bzrtrunk="http://bzr.savannah.gnu.org/r/wget/trunk/"
_bzrmod="wget"

build() {
	cd "$srcdir"
	msg "Connecting to Bazaar server...."

	if [ -d $_bzrmod ] ; then
		cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
		msg "The local files are updated."
	else
		bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
	fi

	msg "Bazaar checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_bzrmod-build"
	cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
	cd "$srcdir/$_bzrmod-build"

	#
	# BUILD HERE
	#
	./bootstrap
	./configure --prefix=/usr
	make || return 1
	make check || return 1
}

package() {
	cd "$srcdir/$_bzrmod-build"
	make DESTDIR="$pkgdir/" install
}
