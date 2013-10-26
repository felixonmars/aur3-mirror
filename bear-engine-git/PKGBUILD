# Maintainer: Hakim Zulkufli <acrox999@gmail.com>

pkgname=bear-engine-git
pkgver=245.e285400
pkgrel=1
pkgdesc="This is the Bear engine, a set of C++ libraries and tools dedicated to creating great 2D games."
arch=('i686' 'x86_64')
url="https://github.com/j-jorge/bear"
license=('GPL3' 'CCPL')
depends=('boost' 'sdl' 'libclaw' 'gettext' 'freetype2' 'wxgtk' )
makedepends=('make' 'cmake' 'git')
conflicts=('bear-engine')
provides=('bear-engine')
source=("$pkgname"::'git+https://github.com/j-jorge/bear.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make

}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}
