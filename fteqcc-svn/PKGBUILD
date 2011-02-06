# Contributor: Anthony Garcia <lagg@[moltenrock]bit.com>
# Maintainer: Anthony Garcia <lagg@[moltenrock]bit.com>

pkgname=fteqcc-svn
pkgver=3525
pkgrel=1
pkgdesc="The FTE QuakeC compiler"
arch=('i686' 'x86_64')
url="http://www.fteqw.com/wiki/index.php?title=FTEQCC_FAQ"
license=('GPL')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=https://fteqw.svn.sourceforge.net/svnroot/fteqw/trunk/engine/qclib/
_svnmod=qclib

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
  make || return 1
  install -D fteqcc.bin "$pkgdir/usr/bin/fteqcc"
}
