# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libreaddata-git
pkgver=20110925
pkgrel=1
pkgdesc="A library to read data from diferent sources (file, memory...)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libreaddata/"
license=('LGPL')
depends=()
makedepends=('gcc' 'git' 'cmake')
options=()
conflicts=('libreaddata')
provides=('libreaddata')
source=()
md5sums=()

_gitroot="https://code.google.com/p/libreaddata/"
_gitname="libreaddata"

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname/libreaddata"
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
