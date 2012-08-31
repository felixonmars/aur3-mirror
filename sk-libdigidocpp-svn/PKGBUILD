# Maintainer: kevku <kevku@gmx.com>
pkgname=sk-libdigidocpp-svn
_pkgname=libdigidocpp
pkgver=62
pkgrel=1
pkgdesc=".bdoc file management library. (Official version by AS Sertifitseerimiskeskus)"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libp11' 'xml-security-c' 'sk-libdigidoc-svn' 'icu')
makedepends=('cmake' 'subversion' 'xsd')
conflicts=('libdigidocpp-svn')

_svntrunk=https://svn.eesti.ee/projektid/idkaart_public/trunk/$_pkgname
_svnmod=$_pkgname

build() {
  cd "$srcdir"
  #rm -rf "$srcdir/$_svnmod"
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
 
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make 
}

package() {
  cd "$srcdir/$_svnmod-build" 
  make DESTDIR="$pkgdir/" install
}

