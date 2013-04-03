# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

pkgname=easypaint-git
pkgver=v0.1.0.78.g2089ae0
pkgrel=1
pkgdesc="Simple Qt-based image editing program"
arch=('i686' 'x86_64')
url="https://github.com/Gr1N/EasyPaint"
license=('MIT')
depends=('qt4')
makedepends=('git' 'cmake')
source=("git://github.com/Gr1N/EasyPaint.git")
sha256sums=('SKIP')
_gitname="EasyPaint"

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd "$srcdir/$_gitname"
	# -DLIB_SUFFIX=/ prevents libraries from being installed in /usr/lib64
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
