# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=streetview-explorer
pkgname=$_pkg-svn
pkgver=65
pkgrel=1
pkgdesc="View StreetView imagery in 3D"
arch=('i686' 'x86_64')
url="http://code.google.com/p/streetview-explorer/"
license=('custom:WTFPL')
depends=('wxgtk' 'curl' 'glew')
makedepends=('subversion')
provides=("$_pkg")
conflicts=("$_pkg")
install="$pkgname.install"
source=("http://code.google.com/p/streetview-explorer/logo"
        "http://sam.zoy.org/wtfpl/COPYING"
        "$_pkg.desktop")
md5sums=('6dc8cc05999a19de43ade9a78e7ffb30'
         '389a9e29629d1f05e115f8f05c283df5'
         '23fbd334278670a023887d50391acd72')

_svntrunk="http://streetview-explorer.googlecode.com/svn/trunk/src"
_svnmod="$_pkg"

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

  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  # bin
  install -Dm755 $_pkg "$pkgdir/usr/bin/$_pkg"

  # desktop file
  install -Dm644 ../$_pkg.desktop \
          "$pkgdir/usr/share/applications/$_pkg.desktop"

  # icon
  install -Dm644 ../logo \
          "$pkgdir/usr/share/pixmaps/$_pkg.png"

  # license
  install -Dm644 ../COPYING \
          "$pkgdir/usr/share/licenses/$_pkg/COPYING"
}
