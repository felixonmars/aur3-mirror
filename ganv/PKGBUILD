# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ganv
pkgver=3876
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=(i686 x86_64)
url="http://drobilla.net/software/$pkgname/"
license=('GPL3')
depends=('gtkmm' 'graphviz')
makedepends=('subversion' 'python2')

_svntrunk=http://svn.drobilla.net/lad/trunk/$pkgname
_svnmod=$pkgname

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

  #
  # BUILD
  #

  # remove ldconfig
  sed -i '/ldconfig/d' wscript

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$_svnmod-build"

  DESTDIR="$pkgdir/" python2 waf install

  # set pkgver
  pkgver=1.2.0
}
