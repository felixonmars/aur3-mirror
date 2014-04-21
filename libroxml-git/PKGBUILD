# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=libroxml-git
_gitname=libroxml
pkgver=r355.cd6c9ab
# commit cd6c9ab198d8e1e467d16a8998c7bc5cac6bf89c
pkgrel=1
pkgdesc='Light C XML parsing library'
url='http://libroxml.net/'
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git' 'cmake' 'autoconf' 'make' 'gcc')
provides=('libroxml')
source=('git+https://code.google.com/p/libroxml/')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"

	./autogen.sh

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}
