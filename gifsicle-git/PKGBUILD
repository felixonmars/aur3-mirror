pkgname=gifsicle-git
_gitname=gifsicle
pkgver=r689.f42290d
pkgrel=1
pkgdesc="A powerful command-line program for creating, editing, manipulating and getting information about GIF images and animations"
arch=('i686' 'x86_64')
url="http://www.lcdf.org/gifsicle/"
license=('GPL')
depends=('libx11')
provides=('gifsicle')
conflicts=('gifsicle')
source=('git+https://github.com/kohler/gifsicle.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="${pkgdir}" install
}
