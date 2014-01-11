# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=swkbrowser-svn
_pkgname=simplewebkit
pkgver=r37565
pkgrel=1
pkgdesc="SimpleWebKit based web browser"
arch=('i686' 'x86_64')
url="http://wiki.gnustep.org/index.php/SimpleWebKit"
license=('GPL')
depends=('simplewebkit-svn')
makedepends=('subversion' 'gcc-objc' 'gendesk')
conflicts=(swkbrowser)
provides=(swkbrowser)
source=($_pkgname::svn+http://svn.gna.org/svn/gnustep/libs/$_pkgname/trunk)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "$srcdir/$_pkgname/SWKBrowser"
	gendesk -n -f --pkgname=SWKBrowser --name="SWK Browser" --pkgdesc="Web browser for GNUstep" --categories="Network;WebBrowser"
}

build() {
	cd "$srcdir/$_pkgname/SWKBrowser"
	. /usr/share/GNUstep/Makefiles/GNUstep.sh
	make
}

package() {
	cd "$srcdir/$_pkgname/SWKBrowser"
	make DESTDIR="$pkgdir" install
	install -Dm644 SWKBrowser.desktop "$pkgdir/usr/share/applications/SWKBrowser.desktop"
}
