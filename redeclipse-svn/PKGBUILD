# Maintainer: Subramaniyam Raizada <subraizada3@gmail.com>

pkgname=redeclipse-svn
_svnmod=redeclipse
pkgver=6393
pkgrel=1
pkgdesc="Red Eclipse is a fun-filled new take on the casual first person arena shooter, built as a total conversion of Cube Engine 2"
arch=('i686' 'x86_64')
url="http://redeclipse.net"
license=('ZLIB' 'MIT' 'CCPL:by-sa' 'CCPL:by' 'custom')
provides=('redeclipse')
depends=('mesa' 'sdl_image' 'sdl_mixer' 'hicolor-icon-theme' 'xdg-utils' 'glu')
makedepends=('subversion' 'gzip' 'ed' 'graphicsmagick')
source=("svn://svn.icculus.org/redeclipse")
md5sums=('SKIP')
install="$pkgname.install"

pkgver() {
	cd "$srcdir/$_svnmod"
	svnversion | tr -d [A-z]
}

build() {
	cd "$srcdir/$_svnmod"
	make -C src/ client server icons
}

package() {
	cd "$srcdir/$_svnmod"
	make -C src/ DESTDIR="$pkgdir" prefix=/usr \
		appname=redeclipse cappname=REDECLIPSE \
		appsrcname=redeclipse \
		system-install
	install -Dm644 doc/all-licenses.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
