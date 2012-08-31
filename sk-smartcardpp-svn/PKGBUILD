# Maintainer: kevku <kevku@gmx.com>
pkgname=sk-smartcardpp-svn	
_pkgname=smartcardpp
pkgver=62
pkgrel=1
pkgdesc="Library for Estonian ID-card (Official version by AS Sertifitseerimiskeskus)"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('opensc')
makedepends=('cmake' 'subversion')
conflicts=('smartcardpp-svn')
source=('gcc47-1.patch')
md5sums=('5a47710b747bbcdeb0ec1ab974944ebd')

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

  patch -Np2 -i "$srcdir/gcc47-1.patch"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}


