# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp-svn
_pkgname=libdigidocpp
pkgver=3786
pkgrel=1
pkgdesc="C++ Library for digidoc.sk.ee client (Community dev version)"
arch=('x86_64' 'i686')
url="http://code.google.com/p/esteid"
license=('LGPL')
depends=('libp11' 'xml-security-c' 'libdigidoc-svn')
makedepends=('cmake' 'subversion' 'xsd')
optdepends=( 'swig: scripting support'
	     'perl: perl scripting support'
             'php: php scripting support'
             'python2: python scripting support')
conflicts=('sk-libdigidocpp-svn')

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


  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
  -DLIB_SUFFIX="" \
  -DSYSCONF_INSTALL_DIR=/etc \
  -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
  -DPYTHON_EXECUTABLE=/usr/bin/python2 \
  -DPYTHON_SITE_PACKAGES_DIR=/usr/lib/python2.7/site-packages \
  -DPYTHON_INCLUDE_PATH=/usr/include/python2.7/
  make 
}

package() {
  cd "$srcdir/$_svnmod-build" 
  make DESTDIR="$pkgdir/" install
}

