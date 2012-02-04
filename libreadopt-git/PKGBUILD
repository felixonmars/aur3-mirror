# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libreadopt-git
pkgver=20110930
pkgrel=1
pkgdesc="A flexible library written in C to parse command line arguments."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libreadopt/"
license=('LGPL')
depends=()
makedepends=('gcc' 'git' 'cmake')
options=()
conflicts=('libreadopt')
provides=('libreadopt')
source=()
md5sums=()

_gitroot="https://code.google.com/p/libreadopt/"
_gitname="libreadopt"

build() {
	cd "$srcdir"
	
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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname/libreadopt"
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
