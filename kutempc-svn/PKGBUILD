# Contributor: totoloco <totoloco at gmail dot com>
pkgname=kutempc-svn
pkgver=68
pkgrel=1
pkgdesc="It is a client for MPD. It is written using Qt-4.1.0. It was heavily inspired by glurp, another MPD client."
arch=('i686' 'x86_64')
url="https://www.schleifi.com/~florian/kutempc/doc/html/"
license=('GPL')
depends=('qt')
makedepends=('subversion')
provides=('kutempc')
conflicts=('kutempc')
replaces=('kutempc')
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://www.schleifi.com/svn/florian/kutempc
_svnmod=kutempc

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
  qmake
  make || return 1
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/apps/kutempc/icons/22x22"
  install -m 755 kutempc "$pkgdir/usr/bin"
  cp icons/*.png "$pkgdir/usr/share/apps/kutempc/icons"
  cp icons/22x22/*.png "$pkgdir/usr/share/apps/kutempc/icons/22x22"
}
