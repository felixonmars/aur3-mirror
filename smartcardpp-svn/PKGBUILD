# Maintainer: kevku <kevku@gmx.com>
pkgname=smartcardpp-svn	
_pkgname=smartcardpp
pkgver=3982
pkgrel=1
pkgdesc="Library for Estonian ID-card (Community dev version)"
arch=('x86_64' 'i686')
url="http://code.google.com/p/esteid"
license=('LGPL')
depends=('opensc')
makedepends=('cmake' 'subversion')
conflicts=('sk-smartcardpp-svn')


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


