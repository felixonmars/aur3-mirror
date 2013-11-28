# Maintainer: lobotomius at gmail dot com
# Contributor: lobotomius at gmail dot com

pkgname=view64-svn
pkgver=10
pkgrel=1
pkgdesc="C64 images viewer"
arch=('i686' 'x86_64')
url='http://view64.sourceforge.net'
license=('GPL')
makedepends=('subversion')
source=("svn+http://svn.code.sf.net/p/view64/code/trunk")
md5sums=('SKIP')
sha1sums=('SKIP')
depends=("sdl2")
conflicts=("")

pkgver() {
	cd trunk
	svnversion | tr -d [A-z]
}

build() {
	cd "$srcdir/trunk"
	make
}

package() {
	cd "$srcdir/trunk"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
	install view64 "$pkgdir/usr/bin/"
	install libview64.so* "$pkgdir/usr/lib/"
}
