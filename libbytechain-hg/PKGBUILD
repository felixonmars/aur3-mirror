# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libbytechain-hg
pkgver=0
pkgrel=1
pkgdesc="A library to handle strings composed of any byte (including 0x00)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libbytechain/"
license=('LGPL')
depends=()
makedepends=('gcc' 'mercurial' 'cmake')
options=()
conflicts=('libbytechain')
provides=('libbytechain')
source=()
md5sums=()

_hgroot="https://code.google.com/p"
_hgrepo="libbytechain"

build() {
	cd "$srcdir"
	
	msg "Connecting to Mercurial server...."
	
	if [ -d "$_hgrepo" ] ; then
		cd "$_hgrepo"
		hg pull -u
		msg "The local files are updated."
	else
		hg clone "$_hgroot/$_hgrepo" "$_hgrepo"
	fi
	
	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."
	
	rm -rf "$srcdir/$_hgrepo-build"
	mkdir -p "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_hgrepo/libbytechain"
	make
}

package() {
	cd "$srcdir/$_hgrepo-build"
	make DESTDIR="$pkgdir" install
}
