# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: BenoÃ®t Rouits <brouits[at]free[dot]fr>

_pkg=flowcanvas
pkgname=$_pkg-svn
pkgver=3427
pkgrel=1
pkgdesc="Gtkmm/Gnomecanvasmm widget for boxes-and-lines style environments."
arch=(i686 x86_64)
url="http://drobilla.net/software/$_pkg/"
license=('GPL')
depends=('libgnomecanvasmm' 'graphviz')
makedepends=('subversion' 'python2')
provides=("$_pkg=1.0.0")

_svntrunk=http://svn.drobilla.net/lad/trunk/$_pkg
_svnmod=$_pkg

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
  sed -i "/ldconfig/d" wscript

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$_svnmod-build"

  DESTDIR="$pkgdir/" python2 waf install
}
