# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=ttapi-hg
pkgver=1
pkgrel=1
pkgdesc="Library developed in C to access the Tuenti social network."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ttapi/"
license=('LGPL')
depends=('libdojson-hg' 'libbytechain-hg' 'libtextchain-hg')
makedepends=('gcc' 'mercurial' 'cmake' 'libdojson-hg' 'libbytechain-hg' 'libtextchain-hg')
options=()
conflicts=('ttapi_pm_extractor' 'libttapi')
provides=('ttapi_pm_extractor' 'libttapi')
source=()
md5sums=()

_hgroot="https://code.google.com/p"
_hgrepo="ttapi"

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_hgrepo/ttapi"
	make
}

package() {
	cd "$srcdir/$_hgrepo-build"
	make DESTDIR="$pkgdir" install
}
