# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libbytechain-git
pkgver=20110925
pkgrel=1
pkgdesc="A library to handle strings composed of any byte (including 0x00)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libbytechain/"
license=('LGPL')
depends=()
makedepends=('gcc' 'git' 'cmake')
options=()
conflicts=('libbytechain')
provides=('libbytechain')
source=()
md5sums=()

_gitroot="https://code.google.com/p/libbytechain/"
_gitname="libbytechain"

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname/libbytechain"
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
