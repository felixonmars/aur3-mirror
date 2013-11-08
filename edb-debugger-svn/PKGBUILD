pkgname=edb-debugger-svn
pkgver=298  
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a QT4 based binary mode debugger with the goal of having usability on par with OllyDbg."
arch=('i686' 'x86_64')
url="http://codef00.com/projects#debugger"
license=('GPL2')
depends=('qt4>=4.5')
makedepends=('boost>=1.35.0' 'subversion')
provides=('edb-debugger')
conflicts=('edb-debugger')
install=edb.install
source=("edb-debugger::svn+http://edb-debugger.googlecode.com/svn/trunk/")
md5sums=('SKIP')
 
 
pkgver() {
  cd "$srcdir/edb-debugger"
  svnversion | tr -d [A-z]
}
 
build() {
  cd "$srcdir/edb-debugger"
 
  qmake-qt4 -makefile DEFAULT_PLUGIN_PATH="/usr/lib/edb/"
 
  make
 
}
 
package() {
  cd "$srcdir/edb-debugger"
 
  make PREFIX=/usr INSTALL_ROOT=$pkgdir/usr install
 
  # correct /usr/lib64 -> /usr/lib on x86_64 (Stolen from the non-svn pkgbuild)
  [ "$CARCH" = "x86_64" ] && (mv $pkgdir/usr/lib64 $pkgdir/usr/lib)
 
  # icons
  install -D -m 644 src/images/edb48-logo.png $pkgdir/usr/share/pixmaps/edb.png
  install -D -m 644 src/images/edb48-logo.png $pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png
 
  # install desktop file
  install -D -m 644 edb.desktop $pkgdir/usr/share/applications/edb.desktop
}