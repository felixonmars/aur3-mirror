# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=wxhexeditor-svn
_pkgbasename=wxhexeditor
pkgver=461
pkgrel=1
pkgdesc="a free hex editor / disk editor for Linux, Windows and MacOSX"
arch=('i686' 'x86_64')
url="http://wxhexeditor.sourceforge.net/"
license=('GPL')
depends=('wxgtk')
makedepends=('subversion')
provides=('wxhexeditor')
conflicts=('wxhexeditor')
source=('wxhexeditor::svn+https://wxhexeditor.svn.sourceforge.net/svnroot/wxhexeditor/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbasename"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/$_pkgbasename"
  sed '/LE): $(OB/{n;s#\(${LDFLAGS}\)\(.*\)-o#\2\1 -o#g}' -i Makefile
  make CXXFLAGS="${CXXFLAGS/-fuse-ld=gold/}"
}

package() {
  cd "$srcdir/$_pkgbasename"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
