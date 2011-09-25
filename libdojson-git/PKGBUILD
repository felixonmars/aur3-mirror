# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libdojson-git
pkgver=20110925
pkgrel=1
pkgdesc="A C library to parse and write JSON files."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libdojson/"
license=('LGPL')
depends=('libreaddata-git' 'libbytechain-git')
makedepends=('gcc' 'git' 'cmake' 're2c' 'libreaddata-git' 'libbytechain-git')
options=()
conflicts=('libdojson')
provides=('libdojson')
source=()
md5sums=()

_gitroot="https://code.google.com/p/libdojson/"
_gitname="libdojson"

build() {
	cd "$srcdir"
	
	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi
	
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	
	rm -rf "$srcdir/$_gitname-build"
	mkdir -p "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname/libdojson"
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
