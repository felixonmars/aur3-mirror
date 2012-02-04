# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=ttapi-git
pkgver=20110930
pkgrel=1
pkgdesc="Library developed in C to access the Tuenti social network."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ttapi/"
license=('LGPL')
depends=('libdojson-git' 'libbytechain-git' 'libtextchain-git')
makedepends=('gcc' 'git' 'cmake' 'libdojson-git' 'libbytechain-git' 'libtextchain-git')
options=()
conflicts=('ttapi_pm_extractor' 'libttapi')
provides=('ttapi_pm_extractor' 'libttapi')
source=()
md5sums=()

_gitroot="https://code.google.com/p/ttapi/"
_gitname="ttapi"

build() {
	cd "$srcdir"
	
	msg "Connecting to GIT server..."
	
	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi
	
	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	
	rm -rf "$srcdir/$_gitname-build"
	mkdir -p "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname/ttapi"
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
