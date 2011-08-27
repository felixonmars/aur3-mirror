# Contributor: totoloco <totoloco at gmail dot com>

pkgname=libcaca-svn
pkgver=3334
pkgrel=2
pkgdesc="A graphics library that outputs text instead of pixels"
arch=('i686' 'x86_64')
license=('WTFPL')
builddepends=('doxygen', 'svn')
buildconflicts=('mono')
conflicts=('libcaca')
replaces=('libcaca')
provides=('libcaca')
depends=('imlib2' 'freeglut' 'ruby' 'slang')

_svntrunk=svn://svn.zoy.org/caca/libcaca/trunk
_svnmod=libcaca

url="http://caca.zoy.org"
source=()
md5sums=()

build() {
  cd "$srcdir"

  msg "SVN checking out..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..." 

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./bootstrap
  ./configure --prefix=/usr
  make CPPUNIT_CFLAGS=-ldl || return 1
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/libcaca/COPYING
}
