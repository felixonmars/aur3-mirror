# Maintainer: Splex
pkgname=libtut-svn
pkgver=185
pkgrel=1
pkgdesc="TUT is a small and portable unit test framework for C++."
arch=('i686' 'x86_64')
url="http://tut-framework.sourceforge.net/"
license=('GPL')
makedepends=('subversion')
provides=('libtut')

_svntrunk=http://tut-framework.svn.sourceforge.net/svnroot/tut-framework/trunk
_svnmod=tut-framework

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  mkdir -m755 -p $pkgdir/usr/include/
  cp -Rp $srcdir/$_svnmod/include/* $pkgdir/usr/include/
  mkdir -m755 -p $pkgdir/usr/share/doc/libtut-svn/
  cp -Rp $srcdir/$_svnmod/doc/htdocs/* $pkgdir/usr/share/doc/libtut-svn/
}
