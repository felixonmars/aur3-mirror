# Contributor: Lee.MaRS<leemars at gmail.com>
pkgname=fqterm-svn
pkgver=1081
pkgrel=1
pkgdesc="FQTerm, a modern terminal emulator."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fqterm/"
license=('GPL2')
depends=('qt4' 'openssl')
makedepends=('svn' 'cmake')
provides=('fqterm')
source=(fqterm::svn+http://fqterm.googlecode.com/svn/trunk/)
md5sums=('SKIP')

#_svntrunk=http://fqterm.googlecode.com/svn/trunk/
_svnmod=fqterm

pkgver() {
  cd "$SRCDEST/$_svnmod"
  svnversion | tr -d [A-z]
}

build() {

  #cd "$srcdir"

  #if [ -d $_svnmod/.svn ]; then
    #(cd $_svnmod && svn up -r $pkgver)
  #else
    #svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  #fi

  #msg "SVN checkout done or server timeout"
  #msg "Starting make..."

  #rm -rf "$srcdir/$_svnmod-build"
  #mkdir "$srcdir/$_svnmod-build"
  #cd "$srcdir/$_svnmod-build"

  ##
  ## BUILD
  ##

  cd "$srcdir/$_svnmod"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
  true
  make
}
package () {
  cd "$srcdir/$_svnmod"
  make DESTDIR="$pkgdir/" install
}
