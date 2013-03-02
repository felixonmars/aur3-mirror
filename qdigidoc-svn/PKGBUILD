# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc-svn
_pkgname=qdigidoc
pkgver=3911
pkgrel=2
pkgdesc="Client for digidoc.sk.ee (Community dev version)"
arch=('x86_64' 'i686')
url="http://code.google.com/p/esteid"
license=('LGPL')
depends=('libdigidocpp-svn' 'qt4' 'libldap')
makedepends=('cmake' 'subversion')
conflicts=('sk-qdigidoc-svn')
install=qdigidoc.install

_svntrunk=https://esteid.googlecode.com/svn/$_pkgname/trunk 
_svnmod=$_pkgname

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"


  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIB_SUFFIX="" -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

