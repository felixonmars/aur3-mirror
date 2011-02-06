# Contributor: T - rttommy@gmail.com
pkgname=sodipodi
pkgver=0.34
pkgrel=1
pkgdesc="Small vector graphic editor, father of Inkscape."
url="http://www.sodipodi.com/index.php3"
arch=('i686' 'x86_64')
depends=(gtk2 pango cairo pcre expat)
makedepends=(gcc make)
license=('GPL')
source=(http://internap.dl.sourceforge.net/sourceforge/sodipodi/sodipodi-0.34.tar.gz)
md5sums=('396cd78526e5a8102fd11114f45a70fe')
build() {
	cd "$startdir/src/sodipodi-0.34"
	./configure --prefix=/usr
	make
	make install
}
