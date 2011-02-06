# Contributor: Olivier Mehani <olivier.mehani@nicta.com.au>
# $Id: PKGBUILD 243 2010-04-23 00:53:05Z shtrom $
pkgname=liboml-git
pkgver=20100423
pkgrel=1
pkgdesc="OML is a measurement library that allows to define measurement points inside applications"
arch=(i686 x86_64)
url="http://omf.mytestbed.net/projects/show/oml"
license=('custom:MIT-Nicta')
depends=('libxml2' 'sqlite3' 'libpcap' 'hyperic-sigar' 'popt')
makedepends=('git' 'autoconf' 'asciidoc')
provides=(liboml)
conflicts=(liboml)

_gitroot="git://mytestbed.net/oml.git"
_gitname="oml"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	autoreconf -i
	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir/" install
	install -D -m 0644 ${srcdir}/$_gitname/COPYING \
		${pkgdir}/usr/share/licenses/${pkgname}/COPYING
} 
