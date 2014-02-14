# Maintainer: Julien Humbert <julroy67@gmail.com>
pkgname=valentina
_commit=a734ccf61671
pkgver=0.2.2
pkgrel=1
pkgdesc="Open source project of creating a pattern making program, whose allow create and modeling patterns of clothing."
arch=('i686' 'x86_64')
url="https://bitbucket.org/dismine/valentina"
license=('GPL')
depends=(qt5-svg)
makedepends=(ccache)
source=(https://bitbucket.org/dismine/valentina/get/v$pkgver.tar.gz)
md5sums=('6f1c479261a5b44d0fd3331cf06b8ef0')

build() {
	cd "$srcdir/dismine-$pkgname-$_commit/"
	qmake-qt5 -r
	make
}

package() {
	cd "$srcdir/dismine-$pkgname-$_commit/"
	install -m755 -D ./bin/valentina $pkgdir/usr/bin/valentina
	
	install -m644 -D ./dist/valentina.desktop $pkgdir/usr/share/applications/valentina.desktop
	install -m644 -D ./dist/valentina.png $pkgdir/usr/share/pixmaps/valentina.png
}
