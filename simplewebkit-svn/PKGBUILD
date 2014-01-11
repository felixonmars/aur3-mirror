# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=simplewebkit-svn
_pkgname=simplewebkit
pkgver=r37565
pkgrel=1
pkgdesc="Native web rendering engine for GNUstep, WebKit API compatible and drop-in replacement"
arch=('i686' 'x86_64')
url="http://wiki.gnustep.org/index.php/SimpleWebKit"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('subversion' 'gcc-objc')
conflicts=($_pkgname)
provides=($_pkgname)
source=($_pkgname::svn+http://svn.gna.org/svn/gnustep/libs/$_pkgname/trunk)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd "$srcdir/$_pkgname"
	. /usr/share/GNUstep/Makefiles/GNUstep.sh
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
