# Maintainer: Jeffery MacEachern <j.maceachern@gmail.com>

pkgname=vnsupport-svn
pkgver=156
pkgrel=2
pkgdesc="A community supported library to communicate with products developed by VectorNav Technologies"
arch=('i686' 'x86_64')
url="http://vnsupport.sourceforge.net/"
license=('LGPL3')
depends=('glibc')
makedepends=('subversion' 'cmake>=2.8')
provides=(vnsupport)
conflicts=(vnsupport)

_svntrunk=https://vnsupport.svn.sourceforge.net/svnroot/vnsupport/trunk
_svnmod=vnsupport

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_svnmod/$_svnmod-build"


  #
  # BUILD
  #
  cmake ../src -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod/$_svnmod-build"
  make DESTDIR="$pkgdir" install || return 1
}
