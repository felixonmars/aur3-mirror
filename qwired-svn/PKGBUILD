pkgname=qwired-svn
pkgver=470
pkgrel=6
pkgdesc="Multi-platform client for the Wired protocol. It is written in C++ and using the Qt4 framework, providing a very good multi-platform experience for the user."
arch=(i686 x86_64)
license=("GPL v2")
depends=(lua qt4 qtwebkit)
makedepends=(subversion)
url="http://qwired-suite.blogspot.com"
source=("${pkgname%-*}::svn+http://qwired-suite.googlecode.com/svn/trunk/"
"qwired.desktop")
md5sums=('SKIP' 'cf4d69f4d9701ef6d9c3878d9ba0b65e')

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}/qw_library"
	
	qmake-qt4 qw_library.pro
	make
	cd "../qw_client"
	qmake-qt4 qw_client.pro
	make
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm755 "bin/qwired" "$pkgdir/usr/bin/qwired"
	install -Dm644 "contrib/QwiredLogo.svg" "$pkgdir/usr/share/icons/qwired.svg"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/qwired/COPYING"
	install -Dm644 "$srcdir/qwired.desktop" "$pkgdir/usr/share/applications/qwired.desktop"
}
